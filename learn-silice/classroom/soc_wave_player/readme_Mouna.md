# 🎵 Mouni's MP3 Player - Lecteur MP3 embarqué sur FPGA

Lecteur MP3 embarqué développé sur FPGA RISC-V avec écran OLED, navigation par fichiers, contrôle du volume matériel et mode piano interactif.

## ✨ Caractéristiques

### 🎼 Lecture Audio
-  Lecture de fichiers MP3 depuis carte SD
-  Contrôle du volume matériel (hardware SNDGEN)
-  Pause/Reprise de la lecture
-  Navigation dans les dossiers
-  Affichage des pochettes d'album (images .raw 128x128)
-  Indicateurs LED synchronisés avec la lecture

### 🎹 Mode Piano Interactif
-  "Album Mystère" : mode piano caché
-  7 notes jouables (DO, RÉ, FA, SOL, LA, SI)
-  Navigation avec les boutons haut/bas
-  Feedback sonore immédiat

### 🖥️ Interface Utilisateur
-  Menu de navigation intuitif
-  Affichage du chemin actuel
-  Support des sous-dossiers
-  Bips sonores de navigation
-  En-tête animé pulsant
-  Affichage limité à 8 fichiers par page


### Mapping des boutons
| Bouton | Fonction (Menu) | Fonction (Lecture) |
|--------|-----------------|-------------------|
| 1 (bit 1) | Retour | Arrêt |
| 2 (bit 2) | Entrer/Sélectionner | - |
| 3 (bit 3) | Haut | Volume + |
| 4 (bit 4) | Bas | Volume - |
| 6 (bit 6) | - | Pause/Reprise |


### 1. Préparer la carte SD

Structure des dossiers :
```
SD Card (FAT32)
└── mp3/
    ├── album1/
    │   ├── track01.mp3
    │   ├── track02.mp3
    │   └── image1.raw  (optionnel, 128x128 grayscale)
    ├── album2/
    │   ├── song2.mp3
    │   └── image2.raw
    └── ...
```

**Format des images d'album :**
- Format : RAW 8-bit grayscale
- Résolution : 128x128 pixels
- Noms supportés : `image1.raw`, `image2.raw`, `image3.raw`

### 2. Compiler le projet
```bash
# Cloner le repo
git clone [URL_DU_REPO]
cd [NOM_DU_REPO]

# Compiler le firmware
make clean
make step7 FIRMWARE=step_final
```

### 3. Lancer le lecteur

1. Insérer la carte SD
2. Programmer le FPGA
3. Le message de bienvenue s'affiche : "Feel free to use Mouni's MP3 Player ;)"
4. Navigation disponible après initialisation SD

## 🎮 Utilisation

### Navigation dans le menu

1. **Haut/Bas** : Parcourir les fichiers/dossiers
2. **Entrer** : 
   - Dossier → Ouvrir
   - Fichier MP3 → Lancer la lecture
   - "Album Mystère" → Mode piano
3. **Retour** : Remonter d'un niveau (minimum `/mp3/`)

### Lecture audio

1. Sélectionner un fichier `.mp3`
2. L'album art s'affiche (si disponible)
3. Lecture démarre automatiquement
4. **Volume +/-** : Ajuster le volume 
5. **Pause** : Mettre en pause 
6. **Retour** : Arrêter et revenir au menu

### Mode Piano 🎹

1. Dans `/mp3/`, sélectionner "Album Mystère"
2. **Haut** : Note suivante
3. **Bas** : Note précédente
4. **Retour** : Quitter le mode piano


## 🔬 Fonctionnalités détaillées

### Volume matériel (SNDGEN)

Le contrôle du volume est géré **directement par le hardware** :
```c
*SNDGEN = (frequency << 8) | volume;
```

- **Bits 8-31** : Incrément de fréquence (0 = transparent, passe MP3)
- **Bits 0-7** : Volume (0-255)
- Le hardware mixe automatiquement avec `audio_buffer`

## 📝 Notes techniques

### Limitations
- Maximum 32 fichiers par dossier affichés
- Affichage limité à 8 fichiers à la fois
- Noms de fichiers : 64 caractères max
- Chemins : 256 caractères max
- Images d'album : format RAW uniquement

### Performances
- Fréquence CPU : ~50 MHz (selon FPGA)
- Taux d'échantillonnage audio : 3124 Hz
- Rafraîchissement écran : ~60 FPS
- Latence SD : Variable (dépend de la carte)

## 👤 Crédits

**Développé par** : Mouna IDRISSI HASSANI AZAMI
**Établissement** : ENSEM - Télécom Nancy

### Bibliothèques utilisées
- **Silice** : Framework FPGA (https://github.com/sylefeb/Silice)
- **ice-v** : CPU RISC-V
- **fat_io_lib** : Support FAT32

## 🐛 Problèmes connus

- [ ] Difficulté avec les canaux de couleurs combinés au curseur du menu
- [ ] Les noms de fichiers très longs peuvent déborder

---

**🎵 Feel free to use Mouni's MP3 Player ;)**
