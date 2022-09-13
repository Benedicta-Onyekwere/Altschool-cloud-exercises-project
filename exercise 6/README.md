# Altschool-cloud-exercises-project   
## CREATING TWO VAGRANT SYSTEMS WITHIN SAME PRIVATE IP AND CONNECTING FROM ONE TO THE OTHER USING SSH 
Started by creating a folder using mkdir and cd then went ahead to initialize vagrant. Aftter Vagrantfile was deposited went ahead to configure it and carry out the rest of the exercise in the following ways: 
<ol>
<li>Created two vagrant machines named alpha and beta using the following command;

`config.vm.define`

They both had same boxes i.e ubuntu/focal64 and also same priveate network which i changed to dhcp.Then went ahead to add some provisitioning scripts and modify the

 `config.vm.provider "virtualbox" do |vb|`

 so that whenever i run the machines they will execute the modifications. These are shown in the images below:

![Screenshot](Img 6.png)

![Screenshot](Img 7.png)

</li><br>
<li>After doing all the configurations, saved and exited nano editor. Then ran the command 

`vagrant up` and both alpha and beta machicnes were installed with the other configurations, i then ssh into them respectively by using the commands;

`vagrant ssh alpha` 

`vagrant ssh beta`

This is as shown below:

![Screenshot](Img 2 (2).png)

![Screenshot](Img 3 (2).png)
</li><br>
<li> Since i want to be able to connect to **alpha** machine with ip adresss **192.168.56.7** from   **beta** machine with ip addr **192.168.56.8**, then i need to genearate an ssh key for **beta** machine which will be copied into **alpha** machine using the command:

`ssh-copy-id -i vagrant@192.168.56.7`

But before this can be done i will need to configure vagrantfile and change the Password Authentication from no to yes otherwise permission will be denied and key will not be copied. The screenshot of generating ssh key is shown below;

![Screenshot](Img 1 (2).png)
 </li><br>

<li>To change the Password Authentication in alpha machine so that i can configure it to allow ssh key from beta instead of a password, i logged in using vagrant ssh alpha, then used the following command;

`sudo nano /etc/ssh/sshd_config`

 This opens up the nano editor where the Password Authentication which is **no** is now changed to **yes**. Then this is saved and nano editor exited, after which to effect this change, system is now restarted or reloaded using the following command;

 `sudo systemctl restart sshd`

 This is shown inthe image below:

 ![Screenshot](Img 2.png)

![Screenshot](Img 5.png)
</li><br>
<li>Then i ssh into **beta** machine again and then ran the command;

`ssh-copy-id -i vagrant@192.168.56.7`

 Which i was granted permission but was further asked for a password, which i used the default password "vagrant". Then was asked to login into **alpha** machine using it's ip addr in order to confirm its's the only key i want that is added, but to authenticate this, had to go back into alpha machine and change the configuration back to **no** using same command mentioned earlier i.e 

`sudo nano /etc/ssh/sshd_config`

Then i saved,exited nano, restarted the system and then logged back into **beta** machine.

 ![Screenshot](Img 3.png)

 ![Screenshot](Img 4.png)

  </li><br>
<li>Now in **beta** machine, logged into or rather connected to **alpha** machine using the command;

`ssh vagrant@192.168.56.7`
 The image is shown below:

      ![Screenshot](Img 8.png)

</li>

</ol>







