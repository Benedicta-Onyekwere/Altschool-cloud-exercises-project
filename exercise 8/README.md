# Altschool-cloud-exercises-project     
## **CREATING ANSIBLE PLAYBOOK TO SETUP A SERVER WITH APACHE**
Ansible is an open-source configuration management, application deployment and orchestration tool. It has an agent-less architecture and uses SSh protocols for communication and also the use of YAML syntax for its configuration files. It only requires Python packages installed on client nodes. Agent-less architecture removes the burden of upgrading packages at each new release, while the SSH protocol makes the communication between server and clients very secure. 

### **BASIC SYSTEM REQUIREMENTS**
A basic Ansible environment has the following components: control machine or node, managed node, inventory file, modules and a playbook.<br>
**Control Machine** – This pretty much acts as the Ansible server where all the playbooks and configuration files are located.<br>
**Managed Node** – These are the nodes managed by the Control Machine. It is also known as remote host. In a server-client architecture, managed nodes are clients where configuration or application is deployed.<br>
**Inventory File** –This is where Ansible holds the information about nodes and group of nodes to be managed. The default ansible host inventory file is located at /etc/ansible/host.<br>
**Modules** – Ansible modules are independent pieces of code which can be used to alter and manage one's infrastructure. These modules can be executed independently (ad-hoc way) or with ansible playbooks. These modules help to perform a wide range of tasks such as install, start, stop, restart services, execute commands, copy files, etc on the hosts. As per Ansible documentation, Modules are idempotent, that is: they will only execute if the state change is required.<br>
**Playbooks** – They are the heart of Ansible. Playbooks are written in YAML format. In a playbook, you can include multiple modules and perform tasks.A playbook is broken into multiple parts:<ol>
<li>Hosts: Where one wants to deploy their configuration.</li>
<li>Remote_user: This involves execution of steps as a defined user.</li>
<li>Tasks: This is where modules are executed with specific variables</li>
<li>Handlers: This triggers a specific execution only once if notified by multiple tasks or system state changes. It depends upon notifying block under tasks.</li>
</ol>

### INSTALLATION OF ANSIBLE
<ol>
<li>I first started by updating my system i.e my control machine which i later named ansiblecontrolleralpha, using the command: 
 
 `sudo apt update`
</li>
<li>Then i installed python and it's dependencies using the command:

`apt install software-properties-common python-apt`

This shown in the image below;


![image](https://user-images.githubusercontent.com/105982108/198492834-2b1dfc76-1f95-49b3-9f55-3a98339cfef3.png)



<li>After which i now installed Ansible using the command:

`apt install -y ansible `

As shown below;

![image](https://user-images.githubusercontent.com/105982108/198493552-7f175f93-1499-4691-8dd8-696a56a35130.png)


</li><br>
<li>Then to start configuring the Ansible playbook, I created a new directory in /root/contoller using the command

`mkdir ansible`<br>
`cd ansible`

Then i checked to confirm that ansible has been properly installed by checking for it's version using the following command:

`ansible-playbook --version`<br>

This is shown in the image below;

![image](https://user-images.githubusercontent.com/105982108/198494228-f07b8970-c458-4701-bf8f-2a0437c79491.png)

</li><br>
<li>Then i created the inventory file using the command;

`nano host-inventory`

Then to create my host or managed node i used digitalocean in order to generate an Ip address which by using SSH i will deploy my playbook on. 

</li><br>

<li>Next i generated an ssh key in my control machine and copied it to digitalocean using the following commands:

`ssh-keygen`<br>
`cat ~/.ssh/id_rsa.pub`

This then generated an Ip address of 206.189.125.147. The images are shown below:

![image](https://user-images.githubusercontent.com/105982108/198494602-299348ff-1cd7-47dd-bcdf-0c445fe8a460.png)


![image](https://user-images.githubusercontent.com/105982108/198494718-39e66a52-a132-4763-b925-1af4deca047a.png)


![image](https://user-images.githubusercontent.com/105982108/198494503-4bcf606f-0fc6-4462-b431-0c9e6b5857c6.png)


![image](https://user-images.githubusercontent.com/105982108/198494817-7099ae81-57ac-495f-a078-4589338776c8.png)


Then i inputted the Ip address in the host-inventory file. This is shown below:

![image](https://user-images.githubusercontent.com/105982108/198494389-9771a536-bd5b-4a45-8b86-d5e6a1759059.png)


<li>Then i pointed Ansible in the path in which it should execute by the command:  

`export ANSIBLE_INVENTORY=/root/host-inventory`

This can also be done by editing the default host inventory file which is located in /etc/ansible/hosts and adding the Ip address of the server.
 
![image](https://user-images.githubusercontent.com/105982108/198494947-ecd81197-e53a-42d1-9c6e-94010136a519.png)

After which i now checked to confirm this has been done by testing the connectivity of my control machine with the digitalocean server by using the command:

`ansisible all -i host-inventory -m ping`

Which was a success as shown below;

![image](https://user-images.githubusercontent.com/105982108/198495073-875987ec-f08f-4fd7-a4ca-a9f4805a3e5f.png)

</ol>

### CREATING ANSIBLE PLAYBOOK

To write or create the Ansible-playbook in which the apache server will be set up, timezone set to Africa/lagos and an index.php file with its content as the main file on the server, i created a yaml file called test.yml,using the command:

`nano test.yml'

 But before this i first set up an index.php file with it's content
 
 `<?php`

 `date("F d, Y h:i:s A e", time());`

`?>`

  with the command:

`nano index.php`

This is as shown below:

![image](https://user-images.githubusercontent.com/105982108/198495182-41ba6b91-46f4-440e-b684-81e6b32fd2da.png)


After which is i now wrote my playbook with the following contents as shown in the image below:

![image](https://user-images.githubusercontent.com/105982108/198495275-517a87cf-5756-4f42-8c63-8be6bc9b75d8.png)


Now to execute the playbook i used the command:

`ansible-playbook test.yml --check`

This is done in order to test that playbook was well configured before deploying to the server. This is as shown below:

![image](https://user-images.githubusercontent.com/105982108/198495453-a0f8d153-7d2d-45b1-b6ae-8f2b6a572101.png)


This shows it was a sucess and can now be executed with the --check as shown in the command above removed.

`ansible-playbook test.yml`

 This showed the successful execution of Ansible Playbook on installing apache, php,timezone, systemctl status. This is as shown below:

![image](https://user-images.githubusercontent.com/105982108/198495560-f36d498a-ac32-4c02-be1b-e1bdda76d61e.png)

![image](https://user-images.githubusercontent.com/105982108/198495710-9a346448-e875-4b19-980f-0dea5f816db7.png)



Then in order to make the index.php file the main content of the server, the apache config file has to be edited from the default index.html file to index.php file using the following command:

`nano /etc/apache2/mods-enabled/dir-conf`

 which i did as shown below:

Before editing

![image](https://user-images.githubusercontent.com/105982108/198495821-afb2ab9f-0259-4934-8b0a-82f10c8857a3.png)


After editing


![image](https://user-images.githubusercontent.com/105982108/198496042-bb6f6c04-bb6a-4e6e-81a7-dc6b23492ecd.png)



Finally, i copied the Ip address 206.189.125.147 and put it in a browser and this was the output:


![image](https://user-images.githubusercontent.com/105982108/198496341-02a5fa1f-e29d-426f-9fdd-2ad15405f068.png)
