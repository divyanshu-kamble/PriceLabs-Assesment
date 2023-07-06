***Price Labs Assessment***

**1.What is happening in this script here?**

The provided script performs the following tasks:

    a. Loops through directories stored as a list in the variable "dtm".
    
    b. Checks the available disk space using df command and compares it against a specified threshold (td).
    
    c. If the available disk space exceeds the threshold, it proceeds with the next steps.
    
    d. Calls the fn_a() function with the directory passed as an argument.
    
    e. The fn_a() function compresses (zips) the "*.log" files that have not been modified in the last 30 days.
    
    f. The compressed archive is named "logs_$(date +'%Y%m%d').tar.gz", where the date is formatted as "YYYYMMDD".
    
    g. Deletes the log files that have been compressed.


**2.How can you ensure the stability?**

    To ensure stability:

    a. Keep the script in a version control system (VCS) like GitHub to track changes and contributions made to the script.

    b. Make the script configurable and avoid hard-coding values. Use variables or command-line arguments to customize the behavior of the script.

    c. Include proper error handling and logging mechanisms to capture any issues or failures during script execution.

    d. Perform thorough testing of the script on various environments to ensure compatibility and stability across different systems.

 **3.How can you ensure the persistence of a script like this on a machine?**

    To ensure the persistence of the script on a machine:

    a. Store the script in a centralized location that is accessible to the intended machines, such as a shared network folder or a version control repository.

    b. Set up proper permissions and access control mechanisms to ensure authorized users can execute and modify the script as needed.

    c. Include the script in system startup processes or scheduled tasks to ensure it runs automatically on machine boot or at specific intervals.

    d. Document the deployment and execution steps for the script to ensure it can be easily replicated or reinstalled on new or additional machines.

**4.Can you identify any possible issues with this script?**

    In the provided script, there are a few modifications made for improved functionality and flexibility. Refer to the modified file in the "Proposed-Assessment" directory for the updated version of the script.

    The modifications include:

    a. Removal of the unused log_file variable.

    b. Making the td threshold value dynamic, allowing it to be passed as a command-line argument with a default value of 80.

    c. Making the dtm list variable accept directory values during script execution rather than hard-coding them.

    d. Modifying the command for compressing and deleting log files to avoid the permission prompt during deletion (rm $ol).

    e. Retrieving the disk usage output directly with ug=$(df $dir | tail -1 | awk '{print $5}' | sed 's/%//') instead of using fs=$(df $dir | tail -1 | awk '{print $1}').

    These modifications enhance the script's flexibility and address potential issues such as hard-coded values, permission prompts, and readability.


