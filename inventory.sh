#!/bin/bash

# Upload inventory files to tower

INVENTORY_BASE='github.com/exmatuz'
INVENTORY_REPO='practicando_a_fondo.git'
INVENTORY_BRANCH='master'
INVENTORY_DIR=`/bin/mktemp -d`
INVENTORY_FILE='hosts'

trap "{ rm -rf ${INVENTORY_DIR} ; }" EXIT

/usr/bin/git clone \
	--quiet \
	--branch ${INVENTORY_BRANCH} \
	https://${INVENTORY_BASE}/${INVENTORY_REPO} \
	${INVENTORY_DIR}

cd ${INVENTORY_DIR}

for i in `ls ${INVENTORY_FILE_PREFIX}`; do

	sudo /usr/bin/tower-manage inventory_import \
		--exclude-empty-groups \
		--overwrite \
		--source=./$i \
		--inventory-name="$i"

done
exit 0

