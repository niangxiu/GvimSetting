#MyGvimSetting
This file is to sync my setting for Gvim

to update all submodules, use:
git submodule init
git submodule update --recursive

if have trouble update submodules, use:
git rm --cached modulename

to add a new submodule, use:
git add <repo> <name>
then check .gitmodule file

for the vimtex to run,
first install latexmk from miktex
then install strawberry Perl


for the windows subsystem linux in Win 11, I need to update submodule under win command line through vpn.
First connect to vpn. 
1. copy the .ssh folder to C:/user/niang/.ssh
2.  In cmd:
        start-ssh-agent
        ssh-add C:/user/niang/.ssh/GitHubKey
3.  Then git push or pull or submodule update.
