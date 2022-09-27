# Altschool-cloud-exercises-project     
## WRITING A BASH SCRIPT  TO SAVE SYSTEM MEMORY(RAM) AND AUTOMATING IT TO DELIVER RESULTS TO AN EMAIL ADDRESS
This project is in three parts:
<ul>

<li>Setting up an email using  SSMTP, Mailutils, and Mutt.</li>
<li>Writing a Bash script to automate the task.</li>
<li>Scheduling a Cronjob for timely execution of the bash script.</li>

</ul>

### SETTING UP EMAIL USING SSMTP, MAILUTILS AND MUTT
SMTP (Simple Mail Transfer Protocol) or SSMTP (Secure Simple Mail Transfer Protocol) is a program used to deliver emails from a local computer to a configured mailhost (mailhub — Here Gmail will be used.). It is sometimes paired with other libraries e.g Mailutils, Mutt, etc. Hence i will be installing them all.

##### INSTALLING PACKAGES
I used the following processes and commands to install SSMTP, Mailutil and Mutt respectively:

Ran:

`# timedatectl set-timezone Africa/Lagos`

`# sudo su`

`# apt update`

I set the timezone to correspond with our time in Lagos, Nigeria. Then updated my system before installing any package. This is as shown below:

[img2(2)]

##### FOR SSMTP:

`apt-get install ssmtp`

##### FOR MAILUTILS

`apt-get install mailutils`

##### FOR MUTT

`apt-get install mutt`

The images are as shown below:

[img9(2)]

[img3(2)]

Next step is to edit the SSMTP configuration file with the following command:

`nano /etc/ssmtp/ssmtp.conf`

The configuration file is shown in the figure below:

![Img12][C:\Users\hp\OneDrive\Pictures]

Then it is edited and configured as follows:

<ul>

<li>Outgoing mail server (SMTP server) or mailhub=smtp.gmail.com:587</li>
<li>root=username@gmail.com</li>
<li>AuthUser=Gmail address</li>
<li>AuthPass=Gmail app password</li>
<li>UseTLS=YES</li>
<li>UseSTARTTLS=YES</li>

</ul>

After editing the file, i got the figure below:

![img1][]

Used the command below to test it out.

`echo "Testingclear!" | mail -s "Test Email" your_email_address@gmail.com`

![img4][]

This worked and i got the following output:

[img5]


### WRITING A BASH SCRIPT TO AUTOMATE THE TASK

The bash script is going to create a log file, which includes the date and time the script was executed, as well as the details of my system's memory.
<ol>
<li>Started by creating a dedicated folder to keep my script and log file:

`mkdir memory_logs && cd memory_logs`</li>

<li>Created a shell file using nano as shown below:

`nano memory_log.sh`</li>

<li> Indicated the absolute path to the bash executable (shebang) using:

`#!/usr/bin/bash`</li>

<li>Then started by assigning the variables needed:

`#path to the directory where the file should be created and used
path=/home/vagrant/memory_logs/log_file.log
#string formatting from date to extract hour and minute
midnight=$(date +%H%M)
#email address to receive the alert
email=bennieonyekwere@gmail.com`</li>


<li>Command to create the file:

`touch ${path}`

This command creates the log_file.log at the specified path.</li>

<li> Then wrapped it all up using the conditionals:

`if [[ ${midnight} == 0000 ]];`

`then echo "HERE IS YOUR MIDNIGHT REPORT" | mutt -a ${path} -s "Midnight RAM Report" -- ${email} && sudo rm -f ${path}`

`else`

`date >> ${path}`

`free -h >> ${path}`

`echo "-------" >> ${path}`

`fi`

The if statement checks the midnight variable against 0000 which is the time at midnight, if the midnight variable equals 0000, then it sends an email containing the log file as an attachment to the email specified (already assigned to the email variable) with the subject of the email as “Midnight RAM Report”, the body of the message “HERE IS YOUR MIDNIGHT REPORT” and then proceeds to delete the log file and start recording afresh.

The mutt -a command is used to attach the log file gotten from the path variable.

While the && Sudo rm -f ${path} part deletes the log file after it has been sent.

The else statement executes when the initial condition is false i.e:

`if [[ ${midnight} != 0000 ]];`

which means it only executes at hours that are not midnight (0000), it keeps on logging the date and system memory until its midnight before it is sent.

The echo “ — — — — “ serves as a delimiter of sorts and it is concluded by fi.

The bash script file now looks as shown below:

[img7]

</li>

</ol>

### SCHEDULING A CRONJOB FOR TIMELY EXECUTION OF THE BASH SCRIPT

Started by editing the crontab file using the command below:

`crontab -e`

Then at the very end of the file i.e the bottom part edited it and added the following:

`0 */1 * * * bash /home/vagrant/memory_logs/memory_log.sh`

I saved and exited the crontab. This command simply points to our bash script and instructs that it should be executed “At minute 0” of every hour of every day of the month.

Sample of the email i received is shown below:

[img10(2)]