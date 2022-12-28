 #!/bin/bash

clear

# Initiate Migration Utility
echo "=============================================="
echo "===                                        ==="
echo "=== Welcome to OC Migration Config Utility ==="
echo "===                                        ==="
echo "=============================================="
echo ""
echo ""

# Store and display current working directory
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
echo "Running script from $DIR"

# Set and display path to EFI
path_to_EFI="${DIR}/EFI"
echo "Path to EFI= " $path_to_EFI

# Set paths to BOOT and OC inside EFI
path_to_OC="${path_to_EFI}/OC"
path_to_BOOT="${path_to_EFI}/BOOT"

# Validate BOOT and OC paths
echo "Checking if it makes senses ..."
FILE=$path_to_BOOT
if [ -d "$FILE" ]; then
    echo "$FILE exist"
else
	echo "Could not find BOOT Folder"
	exit 1
fi

FILE=$path_to_OC
if [ -d "$FILE" ]; then
    echo "$FILE exist"
else
	echo "Could not find OC Folder"
	exit 1
fi

# Commence merge process
echo ""
echo ""
echo "=============================================="
echo "===         Looks good , lets proceed      ==="
echo "=============================================="
echo ""
echo ""

# Set path to output file, and delete if already exists
Config="${path_to_OC}/config.plist"
FILE=$Config
if [ -f "$FILE" ]; then
    echo "$FILE exist, removing"
    rm "$FILE"
fi

# Merge configuration template with output
echo "Merging Template with your personnal PlatformInfo"
/usr/libexec/PlistBuddy -c "Merge '${DIR}/config_template.plist' " "$Config"

# Atempt to find custom .plist, else use given template file
FILE="${DIR}/MyPlatformInfo.plist"
if [ -f "$FILE" ]; then
    echo "$FILE exist"
    PlatformInfo="$FILE"
else
	echo "Could not find Personnalized Platform Info, using PlatformInfo.plist"
    PlatformInfo="${DIR}/PlatformInfo.plist"
fi

# Merge platform information with output
/usr/libexec/PlistBuddy -c "Merge '${PlatformInfo}' " "$Config"

# Validate the complete merge output
echo ""
echo ""
echo "=============================================="
echo "===    config.plist created -- validating  ==="
echo "=============================================="
echo ""
echo ""
./ocvalidate/ocvalidate ./EFI/OC/config.plist

# Finalize migration utility
echo "Done"
