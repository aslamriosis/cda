#!/bin/bash
path=`pwd`
cd $path
if [ ! -f composer.json ];
  then echo 'Missing composer.json in path';
  exit;
fi
previous_hash=`ls -alR ../|sha1sum`
while sleep 1; do
  hash=`ls -alR app/|sha1sum`
  if [ "$previous_hash" != "$hash" ]; then
    composer dump-autoload
    previous_hash=$hash
  fi
done
