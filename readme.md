Price Labs Assessment

*NOTE - The modified file is present in the Proposed-Assesment directory.

1. What is happening in this script here?

The provided script performs the following tasks:
It is trying to find the "*.log" files which have not been modified for the last 30 Days from directories which have very low disk space and then compressing the log files and deleting the files.

let's break down the code one by one :

   a. It loops through directories stored as a list in variable "dmt"

   b.After that it checks the available disk space ug=$(df $dir | tail -1 | awk '{print $5}' | sed 's/%//') where the percentage of disk usage is gathered and then it is compared against a specified   threshold "td" which is set to 80 if its greater than the threshold.

   c. If the available disk space exceeds the threshold, it proceeds with the next steps.

   d. It calls the function fn_a() where the directory is passed to the function and Compresses(zips) all the "*.log" files which have not been modified from the last 30 days.

   e. The compressed archive is named "logs_$(date +'%Y%m%d').tar.gz", where the date is formatted as "YYYYMMDD", starting with the year, followed by the month and day.

   f. And then deletes those log files which have been compressed
   

2. How can you ensure the stability?

    a.The stability of the script should be maintained by keeping the script in a VCS like github, by doing this we can track the changes which has been performed on the script and also the done by whom.

    b.We can also make the script more dynamic by not keeping some values hard-coded, by doing this we can use the script for other tasks as well.

3. How can you ensure the persistency of a script like this on a machine?

To ensure persistency of script across machines we can:

    a.we can keep the script in VCS so that it can cloned on the required machine or can be executed via Jenkins on the agents.

    b.We can also execute the script with the help of Ansible by keep the script in a directory within the ansible playbook and then executing the Ansible playbook by copying the script from source to host machine destination and then executing

    c.with the ansible builtin script module we can execute the script on the specific host machine

4. Can you identify any possible issues with this script?

There are no issues with the given script but i've made certain modifications for more dynamic use of the script.

*NOTE - The modified file is present in the Proposed-Assesment directory.

let's check them below:

    a. The log_file="/var/log/disk_monitor.log" variable is removed from the script as it is not be used in any of the code given below.

    b.The threshold variable "td" value is now made dynamic we can now pass the threshold value while executing the script and if not passed it will select the default value which is set to 80.

    c.The "dtm" list variable is also being modified to take values of directories while executing the command so it is not hard-coded.

    d.In the function after compressing the log files it deletes the log files which have been compressed by "rm $ol" where the "ol" variable has the log files, but it asks for permission for deletion so, [tar czf $dir/logs_$(date +'%Y%m%d').tar.gz $ol --rm $ol] by this the permission is not required.

    e.During the looping of the dmt variable, the fs=$(df $dir | tail -1 | awk '{print $1}') gets the last directory of the disk usage. But the disk usage output can also be retrieved by the command [ug=$(df $dir | tail -1 | awk '{print $5}' | sed 's/%//')]. 


