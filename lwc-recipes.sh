#!/usr/bin/env bash
echo "### Clone git repo."
cd ..
git clone https://github.com/trailheadapps/lwc-recipes
echo "### Cloned git repo."

cd lwc-recipes

echo "### Create scratch org."
sfdx force:org:create -s -f config/project-scratch-def.json -a lwc-recipes
echo "### Created scratch org."

echo "### Source push"
sfdx force:source:push -u lwc-recipes

echo "### Assign permset"
sfdx force:user:permset:assign -n recipes -u lwc-recipes

echo "### Import data"
sfdx force:data:tree:import --plan ./data/data-plan.json

echo "### Open org"
sfdx force:org:open -u lwc-recipes
