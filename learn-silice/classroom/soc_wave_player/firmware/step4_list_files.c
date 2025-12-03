// @sylefeb 2022-01-10
// MIT license, see LICENSE_MIT in Silice repo root
// https://github.com/sylefeb/Silice/

//Displaying folders too
// il manque le retour au dossier parent .. le régler moi-même
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

// Prototypes de fonctions
void scan_files();
void navigate_to(char *foldername);
void go_back();

// Structure to store file information
typedef struct {
  char filename[MAX_FILENAME_LEN];
  int size;
  bool is_dir;
} FileEntry;

FileEntry files[MAX_FILES];
int n_items = 0;
char current_path[MAX_PATH_LEN] = "/mp3/";

// Function to scan and store all files
void scan_files() {
  // Réinitialiser complètement
  n_items = 0;
  
  // Optionnel : nettoyer le tableau (pour être sûr)
  for (int i = 0; i < MAX_FILES; i++) {
    files[i].filename[0] = '\0';
    files[i].size = 0;
    files[i].is_dir = false;
  }
  
  FL_DIR dirstat;
  
  if (fl_opendir(current_path, &dirstat)) {
    struct fs_dir_ent dirent;
    while (fl_readdir(&dirstat, &dirent) == 0 && n_items < MAX_FILES) {
      // Copy filename
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
  
  // Handle ".." - go back
  if (len == 2 && strncmp(foldername, "..", 2) == 0) {
    go_back();
    return;
  }
  
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
  display_set_cursor(0,0);
  display_set_front_back_color(255,0);
  printf("Initializing SD card...\n");
  display_refresh();
  
  while (fl_attach_media(sdcard_readsector, sdcard_writesector) != FAT_INIT_OK) {
    // keep trying, we need this
  }
  
  // Scan files once at startup
  scan_files();
  
  // Main menu loop
  while(1) {
    // Clear screen and draw header
    display_set_cursor(0,0);
    
    // Pulsing header
    display_set_front_back_color((pulse+127)&255, pulse);
    pulse += 7;
    printf("    ===== MP3 =====    \n");
    
    // Display current path
    display_set_front_back_color(200, 0);
    printf("Path: %s\n\n", current_path);
    
    // Display files
    display_set_front_back_color(255,0);
    
    if (n_items == 0) {
      printf("No files found!\n");
    } else {
      for (int i = 0; i < n_items; ++i) {
        if (i == selected) {
          display_set_front_back_color(0, 255);
        } else {
          display_set_front_back_color(255, 0);
        }
        
        if (files[i].is_dir) {
          printf("%d> [DIR]  %s\n", i, files[i].filename);
        } else {
          printf("%d> [FILE] %s\n", i, files[i].filename);
          printf("   [%d bytes]\n", files[i].size);
        }
      }
    }
    
    display_refresh();
    
    // Read buttons with debouncing
    int curr_buttons = *BUTTONS;
    int button_press = curr_buttons & ~prev_buttons;
    
    // Navigation
    if (button_press & (1<<3)) { 
      selected++;
    }
    if (button_press & (1<<4)) { 
      selected--;
    }
    
    // Selection/Enter
    if (button_press & (1<<2)) {
      if (selected >= 0 && selected < n_items) {
        if (files[selected].is_dir) {
          // Navigate into folder (handles ., .., and normal folders)
          navigate_to(files[selected].filename);
          scan_files();
          selected = 0;
        } else {
          continue;
        }
      }
    }
    
    // Wrap around selection
    if (selected < 0) {
      selected = n_items - 1;
    }
    if (selected >= n_items) {
      selected = 0;
    }
    
    prev_buttons = curr_buttons;
  }
}