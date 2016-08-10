#MyGvimSetting
This file is to sync my setting for Gvim

to update submodules, use:
git submodule update

to pull recursively all the submodles, use:
git pull --recurse-submodules

if have trouble update submodules, use:
git rm --cached modulename

to add a new submodule, use:
git submodule add https://....git
Then change the directory of the .gitmodule file, and delete the current repo in the root
