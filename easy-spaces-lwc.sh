#!/usr/bin/env bash
echo "### Clone git repo."
cd ..
git clone https://github.com/trailheadapps/easy-spaces-lwc
echo "### Cloned git repo."

cd easy-spaces-lwc

echo "### Create scratch org."
sfdx force:org:create -s -f config/project-scratch-def.json -a easyspaces
echo "### Created scratch org."

echo "### Source push"
sfdx force:source:push -u easyspaces

echo "### Assign permset"
sfdx force:user:permset:assign -n EasySpacesObjects -u easyspaces
sfdx force:user:permset:assign -n SpaceManagementApp -u easyspaces 

echo "### Import data"
sfdx force:data:tree:import --plan ./data/Plan1.json -u easyspaces
sfdx force:data:tree:import --plan ./data/Plan2.json -u easyspaces

echo "### Open org"
sfdx force:org:open -u easyspaces
