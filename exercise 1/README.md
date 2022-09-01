# Altschool-cloud-exercises-project    
## SETTING UP UBUNTU 20.04 LTS ON LOCAL MACHINE USING VAGRANT<br>
I started this exercise by first downloading Oracle Virtual Machine Virtual Box,then installed vagrant on my local machine, verified it has been installed by inputing 'vagrant' which showed me it was availabe. Then i proceeded to create a Vagrantfile which marks the root directory of my project in which has options for different configurations. Then i used the following steps to achieve this:</
<ol>
<li>I created a directory(that is a  folder) for Virtual Machine in my local machine by making use of the commands 'mkdir'and moved into it using'cd'.</li><br>
<li>Initialized the the Virtual Machine by using the command 'vagrant init ubuntu/focal64' which is the specified box name. This deposited the Vagrantfile in my directory.</li><br>
<li>Configured private network to dhcp(dynamic host configuration protocol).</li><br>

<li>Started the Virtual Machine by using the command 'vagrant up'.</li><br>
<li>Then i installed net tools in order for ifconfig(which is a command used to configure a network interface) to work.</li><br>
<li>Then i configured the network interface by using the command 'ifconfig' which gave me the results that is shown in the attached image.</li><br>

![Screenshot](C:\Github\Altschool-cloud-exercises-project\exercise 1\exer 1 (2).png)

</ol>




