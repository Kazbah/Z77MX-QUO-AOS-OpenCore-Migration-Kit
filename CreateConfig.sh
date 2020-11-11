 #!/bin/bash

echo "=============================================="
echo "===                                        ==="
echo "=== Welcome to OC Migration Config Utility ==="
echo "===                                        ==="
echo "=============================================="
echo ""
echo ""
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
echo "Running script from $DIR"
path_to_EFI="${DIR}/EFI"
echo "Path to EFI= " $path_to_EFI
path_to_OC="${path_to_EFI}/OC"
path_to_BOOT="${path_to_EFI}/BOOT"
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

echo "=============================================="
echo "===         Looks good , lets proceed      ==="
echo "=============================================="
Config="${path_to_OC}/config.plist"
FILE=$Config
if [ -f "$FILE" ]; then
    echo "$FILE exist, removing"
    rm "$FILE"
fi 
echo "Merging Template with your personnal PlatformInfo"
/usr/libexec/PlistBuddy -c "Merge ${DIR}/config_template.plist " "$Config"
FILE="${DIR}/MyPlatformInfo.plist"
if [ -f "$FILE" ]; then
    echo "$FILE exist"
    PlatformInfo="$FILE"
else
	echo "Could not find Personnalized Platform Info, using PlatformInfo.plist"
    PlatformInfo="${DIR}/PlatformInfo.plist"
fi 
/usr/libexec/PlistBuddy -c "Merge ${PlatformInfo} " "$Config"
#/usr/libexec/PlistBuddy -c "Print " "$Config"
echo "Done"




