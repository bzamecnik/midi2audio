# Install FluidSynth MIDI synthesizer which is available for non-realtime batch
# synthesis and some sound fonts.
# This script works on OSX with homebrew.

echo "Installing FluidSynth:"
brew install fluid-synth --with-libsndfile

# brew install p7zip

echo "Installing sound fonts:"

TARGET_FILE="$HOME/Library/Audio/Sounds/Banks/fluid_r3_gm.sf2"
ARCHIVE_FILE="/tmp/fluid-soundfont.tar.gz"
EXTRACTED_DIR="/tmp/fluid-soundfont"
if [ ! -f ${TARGET_FILE} ]; then
  echo "Installing Fluid R3 GM ..."
  if [ ! -f ${ARCHIVE_FILE} ]; then
    wget 'http://www.musescore.org/download/fluid-soundfont.tar.gz' -O ${ARCHIVE_FILE}
  fi
  mkdir -p ${EXTRACTED_DIR}
  tar -xzvf ${ARCHIVE_FILE} -C ${EXTRACTED_DIR}
  mv "${EXTRACTED_DIR}/FluidR3 GM2-2.SF2" ${TARGET_FILE}
  rm -r ${EXTRACTED_DIR}
else
  echo "Fluid R3 GM is up-to-date."
fi

# let's store this sound font as default
mkdir -p ~/.fluidsynth
ln -sf ${TARGET_FILE} ~/.fluidsynth/default_sound_font.sf2

# TARGET_FILE="$HOME/Library/Audio/Sounds/Banks/generaluser_gs_v1.47.sf2"
# ARCHIVE_FILE="/tmp/GeneralUser_GS_1.47.zip"
# EXTRACTED_DIR="/tmp/general_user_gs"
# if [ ! -f ${TARGET_FILE} ]; then
#   echo "Installing GeneralUser GS ..."
#   if [ ! -f ${ARCHIVE_FILE} ]; then
#     wget https://dl.dropboxusercontent.com/u/8126161/GeneralUser_GS_1.47.zip -O ${ARCHIVE_FILE}
#   fi
#   unzip -q ${ARCHIVE_FILE} -d ${EXTRACTED_DIR}
#   mv "$EXTRACTED_DIR/GeneralUser GS 1.47/GeneralUser GS v1.47.sf2" ${TARGET_FILE}
#   rm -r "$EXTRACTED_DIR"
# else
#   echo "GeneralUser GS is up-to-date."
# fi
#
# TARGET_FILE="$HOME/Library/Audio/Sounds/Banks/timbres_of_heaven_v3.2_final.sf2"
# ARCHIVE_FILE="/tmp/Timbres_Of_Heaven_GM_GS_XG_SFX_V_3.2_Final.7z"
# EXTRACTED_DIR="/tmp/Timbres_Of_Heaven_GM_GS_XG_SFX_V_3.2_Final"
# if [ ! -f ${TARGET_FILE} ]; then
#   echo "Installing Timbres Of Heaven ..."
#   if [ ! -f ${ARCHIVE_FILE} ]; then
#     wget 'http://download906.mediafire.com/3npkfyxbm5pg/klclifq2g91o2tq/Timbres+Of+Heaven+GM_GS_XG_SFX+V+3.2+Final.7z' -O ${ARCHIVE_FILE}
#   fi
#   7z x -o${EXTRACTED_DIR} ${ARCHIVE_FILE}
#   mv "${EXTRACTED_DIR}/Timbres Of Heaven GM_GS_XG_SFX V 3.2 Final.sf2" ${TARGET_FILE}
#   rm -r ${EXTRACTED_DIR}
# else
#   echo "Timbres Of Heaven is up-to-date."
# fi

echo "Installed sound fonts:"
ls -lh ~/Library/Audio/Sounds/Banks/
