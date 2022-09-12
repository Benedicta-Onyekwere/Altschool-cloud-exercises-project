# Altschool-cloud-exercises-project    
## CREATING SUDOERS, USER GROUPS AND GENERATING SSH KEYS<br>
 For this exercise, three groups consisting of admin,support and engineering were first created in the following ways:

#### CREATION OF USER GROUP FOR ADMIN AND ADDING ADMIN TO SUDOERS
While trying to create an admin group, foundout it already existed and hence no need to create another instead decided to work with the already created one. Used the command;

 `cat /etc/passwd`

  which is a plain text-based database that contains information for all user accounts on the system. To view the admin used the command:

  ` sudo tail /etc group`
  
   which lists about the last ten groups to view it properly. These commands are attached below. 

![scre 4](https://user-images.githubusercontent.com/105982108/188345667-a63c0896-a03e-42b8-b326-8ff8718a542b.png)

![sce5](https://user-images.githubusercontent.com/105982108/188345842-3575f66d-2883-41cb-83cc-de1370b03da0.png)



Since admin group already exists next thing was to edit the file and add it to sudoers by granting it all the necessary permission using the command:

`sudo visudo /etc/sudoers`

This opened up a nano editor in which i edited the permission for the admin and made it a sudoers as shown in the image below:

![scr 1](https://user-images.githubusercontent.com/105982108/189570166-1142cee7-663e-4807-96a9-a56c5f0f0553.png)


#### CREATION OF USER GROUP FOR SUPPORT AND ENGINEERING 
Then i created the support and engineering groups by using the command:

`sudo groupadd support && sudo groupadd engineering`

This was then created, to view it i used :

`cat /etc/group`

![scre6](https://user-images.githubusercontent.com/105982108/188346228-b50c8f0a-7df8-49d8-ad9b-f402882a3b02.png)

![scre6(1)](https://user-images.githubusercontent.com/105982108/188346354-c28bc346-0818-4092-9138-36c394c0d194.png)

#### CREATION OF 3 USERS FOR EACH GROUP

Then i went ahead and created users for each of the groups by using the command:
`sudo -g -m -s /usr/bin/bash username`

In which i created Nancy as admin user, Michael in support group and Grace in engineering.

![screenshot 2](https://user-images.githubusercontent.com/105982108/188346555-ecc77c39-a4e8-45bd-a352-daa87f7d731d.png)


 #### GENERATION OF SSH KEYS FOR USER IN ADMIN GROUP
 I switched to Nancy who is the admin user by using the command:

 `sudo su -Nancy`

Then generated the ssh key for the admin user Nancy by using the command:

`ssh-keygen`

![screenshot 3](https://user-images.githubusercontent.com/105982108/188346711-33049897-d795-4a33-9dc5-e825f7e2aa92.png)







