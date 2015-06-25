#!/bin/bash

version=$(~/Devel/bumpversion/tbump --allow-dirty --dry-run --list date | grep new_version | sed -r s,"^.*=",,)
#version=$(date +%Y%m%d%H%M)

git flow release start ${version}
echo "${version}" > version.txt
git au
git ci -m "Version bumped"
git flow release finish -m "Version ${version}" -p ${version}

