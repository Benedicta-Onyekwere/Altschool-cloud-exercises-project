# Altschool-cloud-exercises-project    
## INSTALLATION OF PHP 7.4 ON MY LOCAL LINUX MACHINE USING THE ppa:ondrej/php package repo.
I did the installation using the following steps:
<ol>
<li>I ran the following command to update apt-get, which ensures that i have access to the latest versions of anything i want to install:

`sudo apt-get update`
</li>
<li>Next, i installed software-properties-common, which adds management for additional software sources:

`sudo apt -y install software-properties-common`
</li>
<li>Next, i installed the repository ppa:ondrej/php, which will give me all versions of PHP:

`sudo add-apt-repository ppa:ondrej/php`
</li>

<li>Then i updated apt-get again so my package manager can see the newly listed packages:

`sudo apt-get update`
</li>
<li>Then i installed PHP 7.4 using the following command:

`sudo apt -y install php7.4`
</li>
<li>Then i checked the version installed using:

`php -v`

The result is shown in the screenshot below;

![Scrn 1](https://user-images.githubusercontent.com/105982108/188555105-537a504e-61b5-41ff-905a-47b7093052f6.png)

</li>




<li>Then i got the content of /etc/apt/sources.list by using:

`cat /etc/apt/sources.list`

![Scrn 2 (2)](https://user-images.githubusercontent.com/105982108/188555406-1f2e7cff-0c3e-4e6e-b2ac-dca0c85a01e0.png)

</li>

</ol>





