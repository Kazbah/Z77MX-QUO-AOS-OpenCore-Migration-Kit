#!/bin/bash

echo "========================================================"
echo "===                                                  ==="
echo "=== Welcome to OC - Audio Support Clean Up Utility   ==="
echo "===                                                  ==="
echo "========================================================"
echo ""
echo "=============================================="
echo ""
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
echo "Running script from $DIR"
read -p "Drop the EFI folder (not the partition) here so I can know its path " path_to_EFI
echo "Path = " $path_to_EFI
path_to_OC="${path_to_EFI}/OC"
path_to_Audio="${path_to_OC}/Resources/Audio"
echo "Checking if it makes senses ..."
FILE=$path_to_OC
if [ -d "$FILE" ]; then
    echo "$FILE exist"
else
	echo "Could not find OC Folder"
	exit 1
fi 
FILE=$path_to_Audio
if [ -d "$FILE" ]; then
    echo "$FILE exist"
else
	echo "Could not find Audio Folder"
	exit 1
fi


echo "This script will REMOVE all languages besides English UNLESS YOU EDIT IT FIRST"
echo "This script will REMOVE all languages besides English UNLESS YOU EDIT IT FIRST"
echo "This script will REMOVE all languages besides English UNLESS YOU EDIT IT FIRST"
echo "This script will REMOVE all languages besides English UNLESS YOU EDIT IT FIRST"
echo "This script will REMOVE all languages besides English UNLESS YOU EDIT IT FIRST"

read -p "Have you edited the script to your liking ? [Y/N] " answer
if [ $answer == "Y" ] || [ $answer == "y" ]; then 
	echo "ANSWER IS Y"
else
	echo "GO AND EDIT THE SCRIPT"
	exit 1
fi

echo ""
echo ""
echo ""
echo "=== ASKING YOU ONE MORE TIME ==="
read -p "Have you edited the script to your liking ? [Y/N] " answer
if [ $answer == "Y" ] || [ $answer == "y" ]; then 
	echo "ANSWER IS Y --- Proceeding with deletion "
else
	echo "GO AND EDIT THE SCRIPT"
	exit 1
fi
# "=============================================="
# "=== EDIT THE LINES BELOW                   ==="
# "=== PUT # AT BEGINNING OF THE LINE TO MAKE ==="
# "=== IT NON-EXECUTABLE                      ==="
# "=============================================="

### Voice-Over Audio ###
rm ${path_to_Audio}/AXEFIAudio_ar_* #Arabic
rm ${path_to_Audio}/AXEFIAudio_ca_* #Catalan
rm ${path_to_Audio}/AXEFIAudio_cs_* #Czech
rm ${path_to_Audio}/AXEFIAudio_da_* #Danish
rm ${path_to_Audio}/AXEFIAudio_de_* #German
rm ${path_to_Audio}/AXEFIAudio_el_* #Greek ?
# DONT REMOVE ENGLISH (Failsafe)
# rm ${path_to_Audio}/AXEFIAudio_en_* #ENGLISH
rm ${path_to_Audio}/AXEFIAudio_es_* #Spanish
rm ${path_to_Audio}/AXEFIAudio_fi_* #Finish
rm ${path_to_Audio}/AXEFIAudio_fr_* #French
rm ${path_to_Audio}/AXEFIAudio_he_* #Hebrew
rm ${path_to_Audio}/AXEFIAudio_hi_* #Hindi ?
rm ${path_to_Audio}/AXEFIAudio_hu_* #Hungarian
rm ${path_to_Audio}/AXEFIAudio_id_* #Indonesian
rm ${path_to_Audio}/AXEFIAudio_it_* #Italian
rm ${path_to_Audio}/AXEFIAudio_ja_* #Japanese
rm ${path_to_Audio}/AXEFIAudio_ko_* #Korean
rm ${path_to_Audio}/AXEFIAudio_nl_* #Dutch
rm ${path_to_Audio}/AXEFIAudio_no_* #Norwegian
rm ${path_to_Audio}/AXEFIAudio_pl_* #Polish
rm ${path_to_Audio}/AXEFIAudio_pt_* #Portuguese
rm ${path_to_Audio}/AXEFIAudio_ro_* #Romanian
rm ${path_to_Audio}/AXEFIAudio_ru_* #Russian
rm ${path_to_Audio}/AXEFIAudio_sk_* #Slovak
rm ${path_to_Audio}/AXEFIAudio_sv_* #Swedish
rm ${path_to_Audio}/AXEFIAudio_th_* #Thai
rm ${path_to_Audio}/AXEFIAudio_tr_* #Turkish
rm ${path_to_Audio}/AXEFIAudio_zh_* #Chinese

### OpenCore BootPicker Audio ###
### Not all these languages exists at this time but leaving them in case they make them
### Can't delete what you can't find .. so what ?
### 
rm ${path_to_Audio}/OCEFIAudio_ar_* #Arabic
rm ${path_to_Audio}/OCEFIAudio_ca_* #Catalan
rm ${path_to_Audio}/OCEFIAudio_cs_* #Czech
rm ${path_to_Audio}/OCEFIAudio_da_* #Danish
rm ${path_to_Audio}/OCEFIAudio_de_* #German
rm ${path_to_Audio}/OCEFIAudio_el_* #Greek ?
# DONT REMOVE ENGLISH (Failsafe)
# rm ${path_to_Audio}/OCEFIAudio_en_* #ENGLISH
rm ${path_to_Audio}/OCEFIAudio_es_* #Spanish
rm ${path_to_Audio}/OCEFIAudio_fi_* #Finish
rm ${path_to_Audio}/OCEFIAudio_fr_* #French
rm ${path_to_Audio}/OCEFIAudio_he_* #Hebrew
rm ${path_to_Audio}/OCEFIAudio_hi_* #Hindi ?
rm ${path_to_Audio}/OCEFIAudio_hu_* #Hungarian
rm ${path_to_Audio}/OCEFIAudio_id_* #Indonesian
rm ${path_to_Audio}/OCEFIAudio_it_* #Italian
rm ${path_to_Audio}/OCEFIAudio_ja_* #Japanese
rm ${path_to_Audio}/OCEFIAudio_ko_* #Korean
rm ${path_to_Audio}/OCEFIAudio_nl_* #Dutch
rm ${path_to_Audio}/OCEFIAudio_no_* #Norwegian
rm ${path_to_Audio}/OCEFIAudio_pl_* #Polish
rm ${path_to_Audio}/OCEFIAudio_pt_* #Portuguese
rm ${path_to_Audio}/OCEFIAudio_ro_* #Romanian
rm ${path_to_Audio}/OCEFIAudio_ru_* #Russian
rm ${path_to_Audio}/OCEFIAudio_sk_* #Slovak
rm ${path_to_Audio}/OCEFIAudio_sv_* #Swedish
rm ${path_to_Audio}/OCEFIAudio_th_* #Thai
rm ${path_to_Audio}/OCEFIAudio_tr_* #Turkish
rm ${path_to_Audio}/OCEFIAudio_zh_* #Chinese

# =========DONT EDIT BELOW THIS LINE ===========
echo "We are all Done"



