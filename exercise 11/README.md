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


![anb 19]


<li>After which i now installed Ansible using the command:

`apt install -y ansible `

As shown below;

![anb20]
</li><br>
<li>Then to start configuring the Ansible playbook, I created a new directory in /root/contoller using the command

`mkdir ansible`<br>
`cd ansible`

Then i checked to confirm that ansible has been properly installed by checking for it's version using the following command:

`ansible-playbook --version`<br>

This is shown in the image below;

![anb1]

</li><br>
<li>Then i created the inventory file using the command;

`nano host-inventory`

Then to create my host or managed node i used digitalocean in order to generate an Ip address which by using SSH i will deploy my playbook on. 

</li><br>

<li>Next i generated an ssh key in my control machine and copied it to digitalocean using the following commands:

`ssh-keygen`<br>
`cat ~/.ssh/id_rsa.pub`

This then generated an Ip address of 206.189.125.147. The images are shown below:

![anb17]

![anb18]

![anb16]

![anb21]

Then i inputted the Ip address in the host-inventory file. This is shown below:

![anb8]

<li>Then i pointed Ansible in the path in which it should execute by the command:  

`export ANSIBLE_INVENTORY=/root/host-inventory`

This can also be done by editing the default host inventory file which is located in /etc/ansible/hosts and adding the Ip address of the server.

![9(2)] 

After which i now checked to confirm this has been done by testing the connectivity of my control machine with the digitalocean server by using the command:

`ansisible all -i host-inventory -m ping`

Which was a success as shown below;

![anb2]
</ol>

### CREATING ANSIBLE PLAYBOOK

To write or create the Ansible-playbook in which the apache server will be set up, timezone set to Africa/lagos and an index.php file with its content as the main file on the server, i created a yaml file called test.yml,using the command:

`nano test.yml`

 But before this i first set up an index.php file with it's content
 
 `<?php`

 `date("F d, Y h:i:s A e", time());`

`?>`

  with the command:

`nano index.php`

This is as shown below:

![anb7]

After which is i now wrote my playbook with the following contents as shown in the image below:

![anb14(2)]

Now to execute the playbook i used the command:

`ansible-playbook test.yml --check`

This is done in order to test that playbook was well configured before deploying to the server. This is as shown below:

![anb3]

This shows it was a sucess and can now be executed with the --check as shown in the command above removed.

`ansible-playbook test.yml`

 This showed the successful execution of Ansible Playbook on installing apache, php,timezone, systemctl status. This is as shown below:

![anb4(2)]

![anb4(3)]

Then in order to make the index.php file the main content of the server, the apache config file has to be edited from the default index.html file to index.php file using the following command:

`nano /etc/apache2/mods-enabled/dir-conf`

 which i did as shown below:

Before editing

![anb5]

After editing

![anb6]

Finally, i copied the Ip address 206.189.125.147 and put it in a browser and this was the output:

![anb22]