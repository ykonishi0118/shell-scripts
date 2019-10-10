#!/usr/bin/env bash
echo "### Clone git repo."
cd ..
git clone https://github.com/dreamhouseapp/dreamhouse-lwc
echo "### Cloned git repo."

cd dreamhouse-lwc

echo "### Create scratch org."
sfdx force:org:create -s -f config/project-scratch-def.json -a dreamhouse
echo "### Created scratch org."

echo "### Source push"
sfdx force:source:push -u dreamhouse

echo "### Assign permset"
sfdx force:user:permset:assign -n dreamhouse  -u dreamhouse

echo "### Import data"
sfdx force:data:tree:import --plan ./data/sample-data.json -u dreamhouse

echo "### Open org"
sfdx force:org:open -u dreamhouse
