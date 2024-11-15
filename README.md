# AWS Server Setup

This document outlines the configuration and setup for the AWS EC2 server, providing instructions for access, user management, and monitoring.

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

### For Debian/Ubuntu:

```bash
sudo apt update
sudo apt install openssh-client
