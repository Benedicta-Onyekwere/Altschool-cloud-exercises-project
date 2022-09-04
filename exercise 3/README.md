# Altschool-cloud-exercises-project    
## CREATING SUDOERS, USER GROUPS AND GENERATING SSH KEYS<br>
 For this exercise,three groups consisting of admin,support and engineering were first created in the following ways:

### CREATiION OF USER GROUP FOR ADMIN AND ADDED ADMIN TO SUDOERS
While trying to create an admin group, foundout it already existed and hence no need to create another instead decided to use the already created one. Used the command;

 `cat /etc/passwd`

  which is a plain text-based database that contains information for all user accounts on the system. To view the admin used the command:

  ` sudo tail /etc group`
  
   which lists the about the last ten groups to view it properly. These commands are attached below. 

![Screenshot](screenshot 1.png)

![Screenshot](C:\Github\Altschool-cloud-exercises-project\exercise 3)

Since admin group already exists next thing was to edit the file and add it to sudousers by granting it all the necessary permission using the command:

`sudo visudo /etc/sudoers`

This opened up a nano editor in which i edited the permission for the admin and made it a sudoers.


### CREATED USER GROUP FOR SUPPORT AND ENGINEERING 
Then i created the support and engineering groups by using:

`root@ubuntu:~# sudo groupadd support && sudo groupadd engineering`

This was then created to view it i used :

`sudo tail /etcgroup`

This is shown below

![Screenshot](screenshot 1.png)

### CREATION OF 3 USERS FOR EACH GROUP

Then i went ahead and created users for each of the groups by using the command:
`sudo -g -m -s /usr/bin/bash username`

![Screenshot](C:\Users\hp\OneDrive\Pictures)

 ### GENERATION OF SSH KEYS FOR USER IN ADMIN GROUP
 I switched to Nancy who is the admin user by using the command:

 `sudo su -Nancy`

Then generated the ssh key by using the command:

`ssh-keygen`

![Screenshot](C:\Users\hp\OneDrive\Pictures)






