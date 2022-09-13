# Altschool-cloud-exercises-project     
## SETTING UP UBUNTU 20.04 LTS ON LOCAL MACHINE USING VAGRANT<br>
I started this exercise by first downloading Oracle Virtual Machine Virtual Box,then installed vagrant on my local machine, verified it has been installed by inputing 'vagrant' which showed me it was availabe. Then i proceeded with the following steps to install ubuntu 20_04 LTS:
<ol>
<li>I created a directory(that is a  folder) for Virtual Machine in my local machine by making use of the commands 'mkdir'and moved into it using'cd'.</li><br>
<li>Initialized the the Virtual Machine by using the command 'vagrant init ubuntu/focal64' which is the specified box name. This deposited the Vagrantfile in my directory.</li><br>
<li>Configured private network to dhcp(dynamic host configuration protocol) in the nano editor. This is shown in the image below:</li><br>

![Scrn 3](https://user-images.githubusercontent.com/105982108/189784942-bba3af74-225c-4b1e-ab92-5bae423d45bb.png)


<li>Started the Virtual Machine by using the command 'vagrant up'.</li><br>
<li>Then i installed net tools in order for the command 'ifconfig' (which is a command used to configure a network interface) to work.</li><br>
<li>After which i entered the command 'ifconfig' which gave me the results that is shown in the attached image.</li><br>

![exer 1 (2)](https://user-images.githubusercontent.com/105982108/187850535-d6a0c35f-33ab-46ac-a665-e288f2479422.png)



</ol>
