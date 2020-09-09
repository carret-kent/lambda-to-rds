#!/bin/bash

# If you use windows pc. You must use cygwin bash and exec option `-w`, install zip comand.

# Set ORIGIN
while getopts w OPT
do
  case $OPT in
     w) HAS_OPT_W="TRUE";;
     *) echo "invalid option" && exit 0;;
  esac
done
if [ "$HAS_OPT_W" = "TRUE" ]; then
  ORIGIN=`cygpath -wp $PWD`
else
  ORIGIN=`pwd`
fi

# build
rm $ORIGIN/dist.zip

cp -rf "$ORIGIN/src" "$ORIGIN/dist"
# delete
rm -rf "$ORIGIN/dist/node_modules"
rm -f "$ORIGIN/dist/.env"
rm -f "$ORIGIN/dist/.env.local"

docker run --rm -v "$ORIGIN/dist":/var/task lambci/lambda:build-nodejs12.x npm i

cd dist
zip -r dist *
mv "$ORIGIN/dist/dist.zip" "$ORIGIN/dist.zip"

rm -rf $ORIGIN/dist

echo "build finished."
