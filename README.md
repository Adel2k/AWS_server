# AWS Server Setup

This document outlines the configuration and setup for the AWS EC2 server, providing instructions for access, user management, and monitoring.

- **AWS (Amazon Web Services)** is a comprehensive cloud computing platform that offers a variety of services, including storage, databases, networking, and computing power. AWS allows businesses and developers to create scalable applications without investing in physical hardware, as resources are managed and maintained by Amazon.

- **EC2 (Elastic Compute Cloud)** is a core AWS service that provides resizable virtual servers, known as instances, in the cloud. EC2 allows users to easily launch and configure servers with different operating systems and specifications. It is ideal for running applications, hosting websites, and testing software in a flexible, cost-efficient way, as users only pay for the resources they consume.

## Features

- **SSH Access**: Access to the server is controlled through SSH key authentication. Password authentication is disabled.
- **Firewall Configuration**: The UFW firewall is enabled, allowing access only to ports 21 and 22 (SSH) and 80 (HTTP).
- **Fail2ban**: Fail2ban is configured to block IP addresses after 5 failed login attempts within 15 minutes.
- **Apache2 Web Server**: Apache2 is running on port 80, providing a basic web server.

## Automated Scripts

- **automated_user.sh**: This script creates a new user, generates an SSH key pair, and configures SSH access for that user.
- **monitoring.sh**: This script runs every 15 minutes to monitor failed login attempts. If there are any failed attempts, it sends an email notification to the user.

## Prerequisites

Ensure that the following dependencies are installed on your local machine (for Linux users):

### First step:
```plaintext
Launch instance
```
![setup](images/ubuntu.png)

### Second step:
```plaintext
Choose the Ubuntu 22.04
```
```plaintext
Then click on the Launch instance to start
```
![setup](images/setup.png)

### For Debian/Ubuntu:

```bash
    sudo apt update
    sudo apt install openssh-client
```
## Getting started

### Step 1: SSH Access

To access the AWS EC2 instance via SSH, use the following command:

```bash
    ssh username@publicIP -i /path/to/private_key.pem
```

- Replace **username** with your EC2 username.
- Replace **publicIP** with the public IP address of your EC2 instance.
- Replace **/path/to/private_key.pem** with the path to your private SSH key.

The public key should be placed in the **~/.ssh/authorized_keys** file on the server for access to be granted.

### Step 2: Access the Web Server and Apache2

- Install Apache

    Use the following command to install Apache:
```bash
    sudo apt install apache2 -y
```
- Adjust the Firewall (if needed)

    Apache typically runs on port 80 (HTTP) and port 443 (HTTPS). If you’re using UFW (Uncomplicated Firewall), you’ll need to allow traffic on these ports.
```bash
    # Allow HTTP traffic on port 80
    sudo ufw allow 'Apache'

    # If you're planning to use HTTPS, also allow traffic on port 443
    sudo ufw allow 'Apache Full'
```
- Start and Enable Apache

    Ensure Apache is running and set to start automatically on boot:
```bash
    # Start Apache
    sudo systemctl start apache2

    # Enable Apache to start on boot
    sudo systemctl enable apache2
```

- Test the Configuration

    Use the following command to check for syntax errors in the Apache configuration:
```bash
    sudo apache2ctl configtest
```
If the output is Syntax OK, then restart Apache:

```bash
    sudo systemctl restart apache2
```


To view the web server running on port 80, simply visit the public IP address of the EC2 instance in your browser:

![name](images/publicip.png)


```bash
    http://publicIP
```
![name](images/web.png)

### Monitoring and Alerts

The **monitoring.sh** script runs every 15 minutes and checks for failed login attempts. If any failed attempts are detected, an email will be sent to the designated user.

### Firewall and Ports

The UFW firewall is configured to allow traffic only on the following ports:

- SSH (Port 22): For SSH access.
- HTTP (Port 80): For web server access.

To view or modify firewall settings, use the following UFW commands:

- Check status:
```bash
    sudo ufw status
```

- Allow port 80 (if needed):
```bash
    sudo ufw allow 80/tcp
```

- Disable Firewall:
```bash
    sudo ufw disable
```
