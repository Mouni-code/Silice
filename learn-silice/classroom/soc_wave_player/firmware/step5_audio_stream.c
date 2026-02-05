// @sylefeb 2022-01-10
// MIT license, see LICENSE_MIT in Silice repo root
// https://github.com/sylefeb/Silice/

#include "config.h"
#include "sdcard.h"
#include "std.h"
#include "oled.h"
#include "display.h"
#include "printf.h"
//j'ai du bruit dans le son jsp dou il vient
//pausing done
#include "fat_io_lib/src/fat_filelib.h"

void clear_audio()
{
  // wait for a buffer swap (sync)
  int *addr = (int*)(*AUDIO);
  while (addr == (int*)(*AUDIO)) { }
  // go ahead
  for (int b=0 ; b<2 ; ++b) {
    // read directly in hardware buffer
    addr = (int*)(*AUDIO);
    // clear buffer
    memset(addr,0,512);
    // wait for buffer swap
    while (addr == (int*)(*AUDIO)) { }
  }
}

void display_image(FL_FILE *f){
  if (f == NULL) {
    printf("image not found.\n");
    display_refresh();
  } else {
    // Buffer pour l'image originale 128x128
    static unsigned char original_image[128*128];
    
    // Lire l'image complète d'un coup
    fl_fread(original_image, 1, 128*128, f);
    fl_fclose(f);
    
    // Efface l'écran
    memset(display_framebuffer(), 0x00, 128*128);
    
    // AFFICHE LE TITRE EN HAUT
    display_set_cursor(45, 0);
    display_set_front_back_color(255, 0);
    printf("%s\n", f->filename);
    
    // Paramètres de l'image centrée
    int image_size = 90;                    // Taille de l'image réduite (90x90)
    int offset_y = 25;                      // Marge en haut (après le titre)
    int offset_x = (128 - image_size) / 2;  // Centrage horizontal = 19
    
    unsigned char *fb = display_framebuffer();
    
    // Copier et réduire l'image pixel par pixel
    for (int y = 0; y < image_size; y++) {
      for (int x = 0; x < image_size; x++) {
        // Calculer la position dans l'image source (sous-échantillonnage)
        int source_y = (y * 128) / image_size;  // Map 0-89 → 0-127
        int source_x = (x * 128) / image_size;  // Map 0-89 → 0-127
        
        // Lire le pixel de l'image source
        unsigned char pixel = original_image[source_y * 128 + source_x];
        
        // Écrire dans le framebuffer à la position centrée
        fb[(offset_y + y) * 128 + (offset_x + x)] = pixel;
      }
    }
    
    // Rafraîchir l'affichage
    display_refresh();
  }
}

void read_audio(FL_FILE *f){
  int leds = 1;
  int dir  = 0;
  int prev_buttons = 0;
  int paused = 0;
  int playing = 1;
  int saved_position = 0;  

  if (f != NULL) {
    clear_audio();
    
    while (playing) {
      // Lecture des boutons
      int current_buttons = *BUTTONS;
      int button_press = current_buttons & ~prev_buttons;
      prev_buttons = current_buttons;
      
      // Gestion de la pause
      if (paused) {
        // En pause : envoyer du silence
        int *addr = (int*)(*AUDIO);
        memset(addr, 0, 512);
        
        // Attendre le swap
        while (addr == (int*)(*AUDIO)) { }
        
        // Vérifier si on reprend (bouton 1)
        if (button_press & (1<<1)) {
          paused = 0;  // Reprend la lecture
          // Repositionner le fichier à la position sauvegardée
          fl_fseek(f, saved_position, SEEK_SET);
        }
        
        continue;  // Ne pas lire le fichier pendant la pause
      }
      
      //  Sauvegarder la position AVANT de lire
      saved_position = f->bytenum;
      
      // Lecture normale
      int *addr = (int*)(*AUDIO);
      int sz = fl_fread(addr, 1, 512, f);
      
      // Fin du fichier
      if (sz < 512) {
        playing = 0;
        break;
      }
      
      // Attendre le buffer swap
      while (addr == (int*)(*AUDIO)) { }
      
      // Light show
      if (leds == 128 || leds == 1) { 
        dir = 1 - dir; 
      }
      if (dir) {
        leds = leds << 1;
      } else {
        leds = leds >> 1;
      }
      *LEDS = leds;
      
      // Vérifier si on met en pause (bouton 1)
      if (button_press & (1<<1)) {
        paused = 1;  // Met en pause
        // saved_position contient déjà la bonne position
      }
    }
    clear_audio();
    // Fermer le fichier
    fl_fclose(f);
  }
}
void main()
{

  clear_audio();
  int btn = *BUTTONS;
  // install putchar handler for printf
  f_putchar = display_putchar;

  oled_init();
  oled_fullscreen();

  memset(display_framebuffer(),0x00,128*128);
  display_refresh();

  display_set_cursor(0,0);
  display_set_front_back_color(255,0);
  printf("init ... ");
  display_refresh();

  // init sdcard
  sdcard_init();
  // initialise File IO Library
  fl_init();
  // attach media access functions to library
  while (fl_attach_media(sdcard_readsector, sdcard_writesector) != FAT_INIT_OK) {
    // try again, we need this
  }
  printf("done.\n");
  display_refresh();

  int playing = 0;
  int prev_btn = 0;
// open the image file
  FL_FILE *f1 = fl_fopen("/image1.raw","rb");

  // playing the track
  // -> open the file
  FL_FILE *f = fl_fopen("/Edith_Piaf_La_vie_en_rose.raw","rb");
  if (f == NULL) {
    // error, no file
    printf("file not found.\n");
    display_refresh();
    playing = 0;
  } else {
    playing = 1;
    display_set_front_back_color(0,255);
    //printf("music file found.\n");
    //display_refresh();
    //display_set_front_back_color(255,0);
    //printf("playing ... ");
    display_refresh();
    int leds = 1;
    int dir  = 0;
    // plays the entire file
    while (playing) {
      //read_audio(f);
      display_image(f1);

      read_audio(f);
    }
    // close
    fl_fclose(f);
    if (f1) fl_fclose(f1);
    clear_audio(); 
  }

}
