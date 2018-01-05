#!/bin/bash -eux
start=`date +%s`

packer build -only=virtualbox-iso \
	-var-file=ubuntu1604.json \
	-var "iso_path=$HOME/Downloads/vm_source/" \
	packer.json

end=`date +%s`
secs=$((end-start))
printf 'runtime = %02dh:%02dm:%02ds\n' $(($secs/3600)) $(($secs%3600/60)) $(($secs%60))
