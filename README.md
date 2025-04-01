# DrivePulse 🚀  
**A Comprehensive Disk Performance and Health Monitoring Tool**

**DrivePulse** is a user-friendly and efficient tool designed to help you monitor and test the performance of your storage devices. Whether you're a tech enthusiast or a professional system administrator, DrivePulse gives you detailed insights into the health and performance of your drives.

### Features
DrivePulse provides:
- SMART Disk Info: View detailed SMART health metrics for your disk drives.
- Performance Testing: Execute sequential and random I/O tests using `fio`.
- IOPS & Latency Results: Retrieve precise metrics for read/write IOPS and average latency.
- Numbered Disk Selection: Choose a disk easily from a numbered list.
- Progress Bar: Stay updated with real-time progress while tests are running.
- Safety Prompt: Receive clear warnings about data loss risks before performance tests begin.

### Prerequisites
Ensure the following tools are installed on your system:
- **smartmontools**: Install with `sudo apt install smartmontools`.
- **fio**: Install with `sudo apt install fio`.
- **sudo access**: Required for running disk-related commands.

### Installation & Usage
To use DrivePulse:
1. Clone the repository:  
   `git clone https://github.com/your-repo/DrivePulse.git`  
   `cd DrivePulse`
2. Make the script executable:  
   `chmod +x drivepulse.sh`
3. Run the script with sudo:  
   `sudo ./drivepulse.sh`
4. Follow the prompts:
   - Select a disk from the numbered list.
   - View SMART data to check disk health.
   - Confirm if you'd like to proceed with performance tests (risking data loss).

### Important Warning ⚠️
- Performance tests will overwrite data on the selected disk. Do **NOT** run tests on drives containing important files.
- Always confirm your disk selection before proceeding with tests.

### Example Usage
Run the program:  
`sudo ./drivepulse.sh`  
- Select your desired disk from the numbered list.  
- View SMART data.  
- Confirm if you'd like to proceed with performance testing.

### Author
Masoud Khanalizadeh Imani  
Contact: [masoud.khanalizadehimani@gmail.com](mailto:masoud.khanalizadehimani@gmail.com)

### License
This project is licensed under the Apache License 2.0. See the `LICENSE` file for details.
