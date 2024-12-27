# system-monitoring-script
A lightweight Bash script designed to monitor and report key system metrics on macOS. This tool provides insights into CPU usage, memory utilization, disk space, and the top resource-consuming processes. It also generates a detailed system report saved as a log file for future reference.

Features

1).CPU Monitoring: Tracks overall CPU usage and alerts if it exceeds a predefined threshold.

2).Memory Monitoring: Displays free and total memory in MB using macOS utilities.

3).Disk Space Monitoring: Lists disk usage and available space with alerts for critically low disk space.

4).Top Processes: Highlights the top 5 processes consuming the most CPU and memory resources.

5).Report Generation: Automatically creates a detailed system report saved to a timestamped log file.




Usage

Prerequisites

1)macOS with support for native utilities (ps, awk, vm_stat, sysctl, and df).

2)Bash shell (default on macOS).



Installation

Clone the repository to your local machine:

  > git clone https://github.com/your-username/system-monitoring-script.git
> 
Navigate to the script directory:

  > cd system-monitoring-script
> 
Make the script executable:

  > chmod +x system_monitoring.sh
> 
Usage

Run the script in your terminal:

  >./system_monitoring.sh



The script will display the system monitoring results in the terminal and save a detailed report in the current directory.

Example Report Log File

The report is saved to a file named in the format:

system_report_YYYY-MM-DD_HH-MM-SS.log


Example Output
Terminal Output

System Monitoring Script for macOS
-----------------------------------

=== CPU USAGE ===

Current CPU Load: 45.2%

=== MEMORY USAGE ===

Free Memory: 2048MB / Total Memory: 8192MB

=== DISK SPACE USAGE ===

Disk: /dev/disk1 | Usage: 75% | Available: 25GB

=== TOP 5 PROCESSES ===

USER     %CPU    %MEM    COMMAND

root     25.1    1.2     kernel_task

user     10.3    2.1     some_app

...
Generating system report...

Report saved to system_report_2024-12-23_12:00:00.log

Log File Content

System Report - 2024-12-23 12:00:00
__________________________
=== CPU USAGE ===

Current CPU Load: 45.2%

Warning: CPU usage above 80%!

=== MEMORY USAGE ===

Free Memory: 2048MB / Total Memory: 8192MB

=== DISK SPACE USAGE ===

Disk: /dev/disk1 | Usage: 75% | Available: 25GB

Warning: Low disk space on /dev/disk1!

=== TOP 5 PROCESSES ===

USER     %CPU    %MEM    COMMAND

root     25.1    1.2     kernel_task

user     10.3    2.1     some_app
...
__________________________

Contributing

Feel free to fork this repository and submit pull requests for improvements or additional features.


License

This project is licensed under the MIT License. See the LICENSE file for details.

Author

Adiorah Onuora Feel free to connect for collaboration or feedback!

