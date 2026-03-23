#!/bin/sh
set -e

TARGET_DIR=${TARGET_DIR:-/azerothcore/env/dist/etc}
PLAYER_BOTS_DIR=${PLAYER_BOTS_DIR:-/azerothcore/modules}

echo "whoami results: "
whoami

echo "DEBUG: df -h" 
df -h

# Create target directory if it doesn't exist
if [ ! -d "$TARGET_DIR" ]; then
    echo "Target directory $TARGET_DIR does not exist. Creating..."
    mkdir -p "$TARGET_DIR"
fi

if [ ! -d "$PLAYER_BOTS_DIR" ]; then
    echo "Target directory $PLAYER_BOTS_DIR does not exist. Creating..."
    mkdir -p "$PLAYER_BOTS_DIR"
fi

echo "DEBUG: ls -al /preload/etc :"
ls -al /preload/etc
echo "DEBUG: ls -al /preload/modules :"
ls -al /preload/modules
echo "DEBUG: ls -al $TARGET_DIR :"
ls -al $TARGET_DIR
echo "DEBUG: ls -al $PLAYER_BOTS_DIR :"
ls -al $PLAYER_BOTS_DIR

# Check if directory is empty
if [ "$(ls -A $TARGET_DIR)" ]; then
    echo "Directory $TARGET_DIR already populated. Nothing to do."
else
    echo "Directory $TARGET_DIR empty. Copying files..."
    cp -r /preload/etc "$TARGET_DIR/"
    echo "Files copied."
fi

if [ "$(ls -A $PLAYER_BOTS_DIR)" ]; then
    echo "Directory $PLAYER_BOTS_DIR already populated. Nothing to do."
else
    echo "Directory $PLAYER_BOTS_DIR empty. Copying files..."
    cp -r /preload/modules/* "$PLAYER_BOTS_DIR/"
    echo "Files copied."
fi


echo "DEBUG: ls -al $TARGET_DIR :"
ls -al $TARGET_DIR
echo "DEBUG: ls -al $PLAYER_BOTS_DIR/ :"
ls -al $PLAYER_BOTS_DIR/

exit 0
