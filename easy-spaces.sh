#!/usr/bin/env bash
echo "### Clone git repo."
cd ..
git clone https://github.com/trailheadapps/easy-spaces
echo "### Cloned git repo."

cd easy-spaces

echo "### Create scratch org."
sfdx force:org:create -s -f config/project-scratch-def.json -a easyspaces-aura
echo "### Created scratch org."

echo "### Source push"
sfdx force:source:push -u easyspaces-aura

echo "### Assign permset"
sfdx force:user:permset:assign -n EasySpacesObjects -u easyspaces-aura
sfdx force:user:permset:assign -n SpaceManagementApp -u easyspaces-aura 

echo "### Import data"
sfdx force:data:tree:import --plan ./data/Plan1.json -u easyspaces-aura
sfdx force:data:tree:import --plan ./data/Plan2.json -u easyspaces-aura

echo "### Open org"
sfdx force:org:open -u easyspaces-aura
