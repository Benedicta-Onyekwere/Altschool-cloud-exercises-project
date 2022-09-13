# Altschool-cloud-exercises-project   
## CREATING TWO VAGRANT SYSTEMS WITHIN SAME PRIVATE IP AND CONNECTING FROM ONE TO THE OTHER USING SSH 
Started by creating a folder using mkdir and cd then went ahead to initialize vagrant. Aftter Vagrantfile was deposited went ahead to configure it and carry out the rest of the exercise in the following ways: 
<ol>
<li>Created two vagrant machines named alpha and beta using the following command;

`config.vm.define`

They both had same boxes i.e ubuntu/focal64 and also same private network which i changed to dhcp.Then went ahead to add some provisitioning scripts and modify the command:

 `config.vm.provider "virtualbox" do |vb|`

 so that whenever i run the machines they will execute the modifications. These are shown in the images below:

![Img 6](https://user-images.githubusercontent.com/105982108/189796543-5231554b-a2f7-4a87-9c5b-322ccccc919a.png)

![Img 7](https://user-images.githubusercontent.com/105982108/189796668-9ca5c8a6-3518-4743-a324-2ef8bf91b519.png)



</li><br>
<li>After doing all the configurations, saved and exited nano editor. Then ran the command 

`vagrant up` and both alpha and beta machicnes were installed with the other configurations, i then ssh into them respectively by using the commands;

`vagrant ssh alpha` 

`vagrant ssh beta`

This is as shown below:

![Img 2 (2)](https://user-images.githubusercontent.com/105982108/189796941-68f4d508-675f-4c54-ae37-e81d2e130486.png)

![Img 3 (2)](https://user-images.githubusercontent.com/105982108/189797113-df318d8c-bb11-4e95-ad2f-68697ce9e43e.png)


</li><br>
<li> Since i want to be able to connect to <b>alpha</b> machine with ip address <b>192.168.56.7</b> from <b>beta</b> machine with ip address <b>192.168.56.8</b>, then i need to generate an ssh key for <b>beta</b> machine which will be copied into <b>alpha</b> machine using the command:

`ssh-copy-id -i vagrant@192.168.56.7`

But before this can be done i will need to configure ssh-file and change the Password Authentication from no to yes otherwise permission will be denied and key will not be copied. The screenshot of generating ssh key is shown below;

![Img 1 (2)](https://user-images.githubusercontent.com/105982108/189798944-edf6a575-423a-4d75-a2f4-93dcd376ab0d.png)

 </li><br>

<li>To change the Password Authentication in alpha machine so that i can configure it to allow ssh key from beta instead of a password, i logged in using vagrant ssh alpha, then used the following command;

`sudo nano /etc/ssh/sshd_config`

 This opens up the nano editor where the Password Authentication which is **no** is now changed to **yes**. Then this is saved and nano editor exited, after which to effect this change, system is now restarted or reloaded using the following command;

 `sudo systemctl restart sshd`

 This is shown in the image below:

 ![Img 2](https://user-images.githubusercontent.com/105982108/189799254-28086f62-ae34-4d09-9ba1-bebf42e1128b.png)

![Img 5](https://user-images.githubusercontent.com/105982108/189799321-0b3689e9-de85-40d3-99c3-45836c5037f4.png)


</li><br>
<li>Then i ssh into <b>beta</b> machine again and then ran the command;

`ssh-copy-id -i vagrant@192.168.56.7`

 Which i was granted permission but was further asked for a password, which i used the default password "vagrant". Then was prompted to login into <b>alpha</b> machine using it's ip address in order to confirm it is the only key i want that is added, but to authenticate this, had to go back into alpha machine and change the configuration back to **no** using same command mentioned earlier i.e 

`sudo nano /etc/ssh/sshd_config`

Then i saved,exited nano, restarted the system and then logged back into <b>beta</b> machine.

![Img 3](https://user-images.githubusercontent.com/105982108/189799929-9837d0f9-b9da-4ae0-9525-d7a1a26dcda8.png)


![Img 4](https://user-images.githubusercontent.com/105982108/189799851-99ea6d5e-70e5-42a1-bf37-adb7f6d3ab1b.png)

  </li><br>
<li>Now in <b>beta</b> machine, logged into or rather connected to <b>alpha</b> machine using the command;

`ssh vagrant@192.168.56.7`

 The image is shown below:

  ![Img 8](https://user-images.githubusercontent.com/105982108/189800706-2199d52d-ce0e-47bd-b3c8-560bedccf6d7.png)
 



</li>

</ol>







