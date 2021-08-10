> # SETUP PRE CONFIGURATION PIPELINE #


-------------------------
- INSTALL GITLAB RUNNER -
-------------------------

curl -L "https://packages.gitlab.com/install/repositories/runner/gitlab-runner/script.rpm.sh" | sudo bash; yum install -y gitlab-runner

-------------------------------
- CONNECT GITLAB RUNNER TO VM -
-------------------------------

 ">>" https://gitlab.com/zdatabase/postgres_ams/edit                                                                                   
 ">>" https://gitlab.com/zdatabase/postgres_ams/-/settings/ci_cd                                                                       
 ">>" Runners                                                                                                                          
 ">>" EXPLAND                                                                                                                          

Specific runners                                                                                                                       
These runners are specific to this project.                                                                                            
Set up a specific runner automatically Register a runner on a Kubernetes cluster.                                                      
Learn more.                                                                                                                            

Click the button below.                                                                                                                
Select an existing Kubernetes cluster or create a new one.                                                                             
From the Kubernetes cluster details view, applications list, install GitLab Runner.                                                    
Set up a specific runner manually                                                                                                      
Install GitLab Runner and ensure it's running.                                                                                         
Register the runner with this URL: **https://gitlab.com/**

And this registration token: <$TOKEN> 

--------------------------------
- REGISTER GITLAB-RUNNER ON VM -
--------------------------------

[root@masterpg ~]# gitlab-runner register                                                                                              
Runtime platform                           arch=amd64 os=linux pid=24207 revision=3b6f852e version=14.0.0                     
Running in system-mode.                                                                                                                

Enter the GitLab instance URL (for example, https://gitlab.com/): **https://gitlab.com/**                                              
Enter the registration token: **<$TOKEN>**                                                                                             
Enter a description for the runner:  [masterpg]: **postgres_ams_vm181**                                                                
Enter tags for the runner (comma-separated):  **postgres_ams_vm181**                                                                   
Registering runner... succeeded                                                                                                        

runner=fzBZs5bt 
Enter an executor: docker, docker-ssh, parallels, ssh, docker+machine, kubernetes, custom, virtualbox, docker-ssh+machine, shell: **shell** 

Runner registered successfully. Feel free to start it, but if it's running already the config should be automatically reloaded! 

------------------------
- CONFIGURE SUDO LINUX -
------------------------

sed  '/\## Allow root to run any commands anywhere/a gitlab-runner ALL=(ALL) NOPASSWD: ALL' /etc/sudoers >> /etc/sudoers-new; mv -f /etc/sudoers-new /etc/sudoers  
