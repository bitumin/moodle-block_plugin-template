#!/usr/bin/env bash

set -e

# Printf with padding
_printf () {
    printf "%-50s" "$1"
}

# Dependencies validation
DEPENDENCIES=(dirname uname date tr)
check_dependency () {
   command -v $1 >/dev/null 2>&1 || { echo "(ERROR) This script requires $1. Aborting." >&2; exit 1; }
}
for dependency in "${DEPENDENCIES[@]}"; do
   check_dependency ${dependency}
done

# Get name argument
for i in "$@"; do
    case ${i} in
        --name=*)
        NEWNAME="${i#*=}"
        shift
        ;;
        --copyright=*)
        NEWCOPYRIGHT="${i#*=}"
        shift
        ;;
        *)
        ;;
    esac
done
if ! [[ ${NEWNAME} =~ ^[a-z]+$ ]]; then
    echo "(ERROR) Name parameter is required and must be a letters only lowercase value. Eg: --name=widget"; exit 1
fi
if ! [[ ${NEWCOPYRIGHT} =~ ^[-_0-9a-zA-Z\>\<@.\ ]+$ ]]; then
    echo "(ERROR) Copyright parameter is required and must be a valid alphanumeric string. Eg: --copyright=\"2016 Your Name <your@email.address>\""; exit 1
fi

# Get operative system
UNAMEOUT="`uname -s`"
case ${UNAMEOUT} in
  'Linux')      OS='Linux';;
  'Darwin')     OS='Mac';;
  *) ;;
esac
if [ -z ${OS+x} ]; then
    echo "(ERROR) This script is only compatible with Linux or OSX. Unable to recognise your operative system."; exit 1
fi

NEWVERSION=`date +%Y%m%d00`
NEWNAMEUPPERCASE=`echo ${NEWNAME} | tr '[:lower:]' '[:upper:]'`

cd "$(dirname "$0")"

_printf "Creating new plugin folder block/$NEWNAME..."
cd ..
cp -R newblock ${NEWNAME}
printf "OK\n"

_printf "Cleaning new block workspace..."
cd ${NEWNAME}
rm -rf .git
rm rename.sh
rm README.md
printf "OK\n"

_printf "Renaming lang files..."
mv lang/en/block_newblock.php lang/en/block_${NEWNAME}.php
printf "OK\n"

_printf "Renaming main block class..."
mv block_newblock.php block_${NEWNAME}.php
printf "OK\n"

_printf "Updating references within files..."
if [ "$OS" = "Linux" ]; then
    find . -type f -exec sed -i 's/newblock/'"$NEWNAME"'/g' {} \;
    find . -type f -exec sed -i 's/newblock/'"$NEWNAMEUPPERCASE"'/g' {} \;
else
    find . -type f -exec sed -i '' 's/newblock/'"$NEWNAME"'/g' {} \;
    find . -type f -exec sed -i '' 's/newblock/'"$NEWNAMEUPPERCASE"'/g' {} \;
fi
printf "OK\n"

_printf "Updating copyright info within files..."
if [ "$OS" = "Linux" ]; then
    find . -type f -exec sed -i 's/2016 Your Name <your@email.address>/'"$NEWCOPYRIGHT"'/g' {} \;
else
    find . -type f -exec sed -i '' 's/2016 Your Name <your@email.address>/'"$NEWCOPYRIGHT"'/g' {} \;
fi
printf "OK\n"

_printf "Updating plugin version..."
if [ "$OS" = "Linux" ]; then
    sed -i 's/2017111400/'"$NEWVERSION"'/g' version.php
else
    sed -i '' 's/2017111400/'"$NEWVERSION"'/g' version.php
fi
printf "OK\n"

_printf "Creating new README.md file..."
echo "# Moodle block plugin ${NEWNAME}" > README.md
printf "OK\n"

printf '\nRenaming done without errors. Happy codding!\n'

exit 0
