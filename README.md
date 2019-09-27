# projAImotive
home project for AImotive

# Usage : 

The repository is public now, so anyonecan doownload this github project and
clone it. 
Just create a new Jenkins job, define jenkins pipeline from groovy , and select jenkins pipeline from SCM . 
Copy and paste the repo link and provide the groovy pipeline name.

This pipeline creates a docker image where the YAML-CPP lib is being pulled , getting build, and archive the 
built lib to a '.tar.gz' 

To acquire this archive, the pipeline spins up a container with limited resources , and copies the archive 
which then will be uploaded as an artifact to Jenkins. 

If there is a permissaon related issue between the Jenkins user and docker , then : 

- sudo gpasswd -a jenkins docker
- newgrp docker
- sudo systemctl restart jenkins

This will resolve the permission issue and allows jenkins user to execute docker related commands
