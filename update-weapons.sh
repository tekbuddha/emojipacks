#!/bin/bash -x

YAML=packs/weapons.yaml

for IMAGE in $( cd assets ; ls )
do 
    if ! grep $IMAGE packs/weapons.yaml >/dev/null; then 
	NAME=$( echo $IMAGE | cut -f 1 -d . ) 
	NAMES="$NAMES $NAME"
	echo "  - name: $NAME" >>$YAML
	echo "    src: https://github.com/bdobyns/emojipacks/raw/weapons/assets/$IMAGE" >>$YAML

    fi
done

git add $0 assets packs
git commit -m "added these weapons $NAMES"
git push


for i in $( cd assets ; ls ); do if ! grep $i packs/weapons.yaml >/dev/null; then NAME=$( echo $i | cut -f 1 -d . ) ; echo $i; fi; done
