// @sylefeb 2022-01-10
// MIT license, see LICENSE_MIT in Silice repo root
// https://github.com/sylefeb/Silice/

//Displaying menu and navigating into folders
#include "config.h"
#include "std.h"
#include "oled.h"
#include "display.h"
#include "printf.h"
#include "sdcard.h"
#include <stdbool.h>


// include the fat32 library
#include "fat_io_lib/src/fat_filelib.h"

#define MAX_FILES 32
#define MAX_FILENAME_LEN 64
#define MAX_PATH_LEN 256

void scan_files();
void navigate_to(char *foldername);
void go_back();

typedef struct {
  char filename[MAX_FILENAME_LEN];
  int size;
  bool is_dir;
} FileEntry;

FileEntry files[MAX_FILES];
int n_items = 0;
char current_path[MAX_PATH_LEN] = "/mp3/";
void clear_audio()
{
  int *addr = (int*)(*AUDIO);
  while (addr == (int*)(*AUDIO)) { }
  for (int b=0 ; b<2 ; ++b) {
    addr = (int*)(*AUDIO);
    memset(addr,0,512);
    while (addr == (int*)(*AUDIO)) { }
  }
}

void display_image(FL_FILE *f, FileEntry *f1){
  if (f == NULL) {
    printf("image not found.\n");
    display_refresh();
  } else {
    static unsigned char original_image[128*128];
    
    fl_fread(original_image, 1, 128*128, f);
    fl_fclose(f);
    memset(display_framebuffer(), 0x00, 128*128);
    
    display_set_cursor(20, 5);
    display_set_front_back_color(255, 0);
    printf("%s", f1->filename);  
    
    int image_size = 90;
    int offset_y = 25;
    int offset_x = (128 - image_size) / 2;
    
    unsigned char *fb = display_framebuffer();
    
    for (int y = 0; y < image_size; y++) {
      for (int x = 0; x < image_size; x++) {
        int source_y = (y * 128) / image_size;
        int source_x = (x * 128) / image_size;
        
        unsigned char pixel = original_image[source_y * 128 + source_x];
        fb[(offset_y + y) * 128 + (offset_x + x)] = pixel;
      }
    }
    
    display_refresh();
  }
}

void play_scale() {
  int notes[7] = {
    (1<<24)/56818,  // DO
    (1<<24)/50596,  // RE
    (1<<24)/42568,  // FA  
    (1<<24)/37952,  // SOL
    (1<<24)/31896,  // LA
    (1<<24)/28416,  // SI
    0
  };
  
  int current_note = 0;
  int prev_buttons = 0;
  
  while(1) {
    *SNDGEN = (notes[current_note] << 8) | 200;
    
    int buttons = *BUTTONS;
    int press = buttons & ~prev_buttons;
    prev_buttons = buttons;
    
    if(press & (1<<3)) {
      current_note = (current_note + 1) % 7;
    }
     
    if(press & (1<<4)) {
      current_note = (current_note - 1 + 7) % 7;
    }
    
    if(press & (1<<1)) {
      *SNDGEN = 0;
      break;
    }
  }
}


// Variable globale pour le volume MP3 (10-255)
int mp3_volume = 100;  // Volume MAX par défaut
void read_audio(FL_FILE *f){
  int leds = 1;
  int dir  = 0;
  int prev_buttons = 0;
  int paused = 0;
  int playing = 1;
  int saved_position = 0;  

  if (f != NULL) {
    clear_audio();
    
    // SNDGEN transparent (passe le MP3 sans tonalité)
    *SNDGEN = (0 << 8) | mp3_volume;
    
    while (playing) {
      int current_buttons = *BUTTONS;
      int button_press = current_buttons & ~prev_buttons;
      prev_buttons = current_buttons;
      
      // Bouton retour
      if (button_press & (1<<1)) {
        playing = 0;
        break;
      }
      
      // Volume UP (bouton 3) 
      if (button_press & (1<<3)) {
        mp3_volume += 10;
        if (mp3_volume > 255) mp3_volume = 255;
        *SNDGEN = (0 << 8) | mp3_volume; 
      }
      
      // Volume DOWN (bouton 4)
      if (button_press & (1<<4)) {
        mp3_volume -= 10;
        if (mp3_volume < 25) mp3_volume = 25;
        *SNDGEN = (0 << 8) | mp3_volume;
      }
      
      // Pause
      if (paused) {
        int *addr = (int*)(*AUDIO);
        memset(addr, 0, 512);
        while (addr == (int*)(*AUDIO)) { }
        
        if (button_press & (1<<6)) {
          paused = 0;
          fl_fseek(f, saved_position, SEEK_SET);
        }
        continue;
      }
      
      saved_position = f->bytenum;
      
      // LECTURE BRUTE (hardware SNDGEN gère le volume !)
      int *addr = (int*)(*AUDIO);
      int sz = fl_fread(addr, 1, 512, f);
      if (sz < 512) {
        playing = 0;
        break;
      }
      
      while (addr == (int*)(*AUDIO)) { }
      
      // Light show LEDs
      if (leds == 128 || leds == 1) { 
        dir = 1 - dir; 
      }
      if (dir) {
        leds = leds << 1;
      } else {
        leds = leds >> 1;
      }
      *LEDS = leds;
      
      if (button_press & (1<<6)) {
        paused = 1;
      }
    }
    
    *SNDGEN = 0;  // Arrêt SNDGEN
    clear_audio();
    *LEDS = 0;
    fl_fclose(f);
  }
}

void scan_files() {
  n_items = 0;

  for (int i = 0; i < MAX_FILES; i++) {
    files[i].filename[0] = '\0';
    files[i].size = 0;
    files[i].is_dir = false;
  }
  
  if (strncmp(current_path, "/mp3/", 5) == 0 && strlen(current_path) == 5) {
    strcpy(files[0].filename, "Album Mystere");
    files[0].size = 999999;
    files[0].is_dir = false;
    n_items = 1;
  }
  
  // Fichiers SD normaux après
  FL_DIR dirstat;
  if (fl_opendir(current_path, &dirstat)) {
    struct fs_dir_ent dirent;
    while (n_items < MAX_FILES) {
      int read_result = fl_readdir(&dirstat, &dirent);
      if (read_result != 0 || dirent.filename[0] == '\0') break;
      
      if (dirent.filename[0] == '.') continue;  // Ignore . et ..
      
      int i = 0;
      while (dirent.filename[i] && i < MAX_FILENAME_LEN - 1) {
        files[n_items].filename[i] = dirent.filename[i];
        i++;
      }
      files[n_items].filename[i] = '\0';
      
      files[n_items].size = dirent.size;
      files[n_items].is_dir = dirent.is_dir;
      
      n_items++;
    }
    
    fl_closedir(&dirstat);
  }
  
  *LEDS = n_items;
}


// Go back to parent directory
void go_back() {
  int len = strlen(current_path);
  
  // Remove trailing slash if present
  if (len > 1 && current_path[len-1] == '/') {
    current_path[len-1] = '\0';
    len--;
  }
  
  // Find last slash
  for (int i = len - 1; i >= 0; i--) {
    if (current_path[i] == '/') {
      current_path[i+1] = '\0';
      break;
    }
  }
  
  // Make sure we don't go above root
  if (strlen(current_path) == 0) {
    current_path[0] = '/';
    current_path[1] = '\0';
  }
}

// Navigate into a folder
void navigate_to(char *foldername) {
  int len = strlen(foldername);
  
  // Ne gère plus ".." ici car on l'ignore maintenant dans scan_files
  // Handle "." - stay in current directory (do nothing)
  if (len == 1 && foldername[0] == '.') {
    return;
  }
  
  int path_len = strlen(current_path);
  int name_len = len;
  
  // Check if we have enough space
  if (path_len + name_len + 2 < MAX_PATH_LEN) {
    // Add folder name
    strcat(current_path, foldername);
    // Add trailing slash if not present
    if (current_path[strlen(current_path)-1] != '/') {
      strcat(current_path, "/");
    }
  }
}

void display_album_image(FileEntry *f) {
  char imagepath[MAX_PATH_LEN];
  char imagename[20];
  FL_FILE *img = NULL;
  
  // Essaie image1.raw, image2.raw, image3.raw
  for (int i = 1; i <= 3 && img == NULL; i++) {
    // Construire le chemin manuellement
    strcpy(imagepath, current_path);  // "/mp3/album1/"
    
    // Construire "imageN.raw"
    strcpy(imagename, "image");
    
    // Ajouter le numéro (conversion manuelle)
    if (i == 1) {
      strcat(imagename, "1");
    } else if (i == 2) {
      strcat(imagename, "2");
    } else if (i == 3) {
      strcat(imagename, "3");
    }
    
    strcat(imagename, ".raw");  // "image1.raw"
    
    // Chemin complet
    strcat(imagepath, imagename);  // "/mp3/album1/image1.raw"
    
    img = fl_fopen(imagepath, "rb");
  }
  
  if (img != NULL) {
    display_image(img,f);
  } else {
      display_set_front_back_color(255, 0);
      printf(" No Album Art ");
    display_refresh();
  }
}


void quick_beep() {
   int inc = (1 << 24) / 80000; // Apparemment avec 40000 on peut faire le son "LA"
  
   *SNDGEN = (inc << 8) | (50); 
  
   for (volatile int wait = 0; wait < 100000; wait++) { }
  
   *SNDGEN = (inc << 8) | 0;
 }


void main()
{
  int selected = 0;
  int pulse = 0;
  int prev_buttons = 0;
  
  // turn LEDs off
  *LEDS = 0;
  
  // install putchar handler for printf
  f_putchar = display_putchar;
  
  // init screen
  oled_init();
  oled_fullscreen();
  oled_clear(0);
  
  // init sdcard
  sdcard_init();
  
  // initialise File IO Library
  fl_init();
  
  // attach media access functions to library
  display_set_cursor(20,60);
  display_set_front_back_color(255,0);
  printf("Feel free to use\n");
  printf("Mouni's MP3 Player ;) \n");
  for (int delay = 0; delay < 500000; delay++) { }
  display_refresh();
  
  while (fl_attach_media(sdcard_readsector, sdcard_writesector) != FAT_INIT_OK) {
    // keep trying, we need this
  }
  
  scan_files();

  // TEST DIRECT au démarrage
  int inc = (1 << 24) / 50000;
  *SNDGEN = (inc << 8) | 50;  // Volume MAX
  for (volatile int i = 0; i < 3000000; i++) { }  // 5 secondes
  *SNDGEN = (inc << 8) | 0;  // Éteint

// Main menu loop
while(1) {
  
  // Main menu loop
  while(1) {
    //  EFFACER LE FRAMEBUFFER AVANT DE REDESSINER
    memset(display_framebuffer(), 0x00, 128*128);
    
    // Clear screen and draw header
    display_set_cursor(0,0);
    
    // Pulsing header
    display_set_front_back_color((pulse+127)&255, pulse);
    pulse += 7;
    printf("    ===== MP3 =====    \n");
    
    // Display current path
    display_set_front_back_color(255, 0);
    printf("Path: %s\n\n", current_path);
    
    // Display files
    display_set_front_back_color(255,0);
    
    if (n_items == 0) {
      printf("No files found!\n");
    } else {
      // Limiter l'affichage aux 8 premiers fichiers
      int max_display = (n_items > 8) ? 8 : n_items;
      
      for (int i = 0; i < max_display; ++i) {
        if (i == selected) {
          display_set_front_back_color(0, 255);
        } else {
          display_set_front_back_color(255, 0);
        }
        
        if (files[i].is_dir) {
          printf("%d> [DIR]  %s\n", i, files[i].filename);
        } else {
          printf("%d> [FILE] %s\n", i, files[i].filename);
        }
      }
      
      // Indiquer s'il y a plus de fichiers
      if (n_items > max_display) {
        display_set_front_back_color(255, 0);
        printf("\n... %d more ...\n", n_items - max_display);
      }
    }
    
    display_refresh();
    
    // Gestion des boutons
    int curr_buttons = *BUTTONS;
    int button_press = curr_buttons & ~prev_buttons;

    // DOWN
    if (button_press & (1 << 4)) {
      quick_beep();
      selected++;
      *LEDS = 1 << (selected % 8);
    }

    // UP
    if (button_press & (1 << 3)) {
     quick_beep();
      selected--;
      if (selected < 0) {
        *LEDS = 1 << ((n_items - 1) % 8);
      } else {
        *LEDS = 1 << (selected % 8);
      }
    }

    // BACK
    if (button_press & (1 << 1)) {
      quick_beep();
      if (strlen(current_path) > 5) {
        go_back();
        scan_files();
        selected = 0;
      }
    }

   // ENTER
  if (button_press & (1 << 2)) {
    quick_beep();
    if (selected >= 0 && selected < n_items) {

      // Album Mystere : nom exact
        if (strncmp(files[selected].filename, "Album Mystere", 13) == 0) {
          memset(display_framebuffer(), 0x00, 128*128);
          display_set_cursor(20, 30);
          display_set_front_back_color(255, 0);
          printf("Piano Mode :p");
          display_set_cursor(10, 50);
          printf("Haut/Bas: notes");
          display_set_cursor(10, 60);
          printf("Retour: stop");
          display_refresh();

          for (volatile int d = 0; d < 1000000; d++) { }

          *SNDGEN = 0;
          play_scale();// blocant jusqu’à BACK

          // Quand on revient du piano, on rescane le répertoire courrant
          scan_files();
          selected = 0;

        } else if (files[selected].is_dir) {
          // Dossier normal
          navigate_to(files[selected].filename);
          scan_files();
          selected = 0;

        } else {
          // Fichier audio normal
          if (strncmp(files[selected].filename, "image", 5) != 0) {
            display_album_image(&files[selected]);
            for (volatile int d = 0; d < 1000000; d++) { }

            char filepath[MAX_PATH_LEN];
            strcpy(filepath, current_path);
            strcat(filepath, files[selected].filename);

            FL_FILE *audio = fl_fopen(filepath, "rb");
            if (audio) {
              read_audio(audio);
            }
            // À la fin de la lecture, on réinitialise la lib et on rescane
            fl_init();
            while (fl_attach_media(sdcard_readsector, sdcard_writesector) != FAT_INIT_OK) {
            }
            scan_files();
            selected = 0;
          }
        }
      }
    }



    if (selected < 0) selected = n_items - 1;
    if (selected >= n_items) selected = 0;

    prev_buttons = curr_buttons;
}
}
}