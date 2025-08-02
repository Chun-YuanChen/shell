#!/bin/bash
set -x

############################################
# DSI CONSULTING INC. Project setup script #
############################################
# This script creates standard analysis and output directories
# for a new project. It also creates a README file with the
# project name and a brief description of the project.
# Then it unzips the raw data provided by the client.

if [ -d newproject ]; then
  echo "Directory 'newproject' already exists. Please remove it before running this script."
  exit 1
fi
mkdir newproject
cd newproject

mkdir analysis output
touch README.md
echo "# Project Name: DSI Consulting Inc." > README.md
touch analysis/main.py

# download client data
curl -Lo rawdata.zip https://github.com/UofT-DSI/shell/raw/refs/heads/main/02_activities/assignments/rawdata.zip
unzip -q rawdata.zip

###########################################
# Complete assignment here


# ==============================================================================
# Program         : Machine Learning Software Foundations
# Module          : Shell and Git
# Cohort          : 7
# Author          : Chun-Yuan Chen
# GitHub          : https://github.com/Chun-YuanChen
# Date Created    : 2025-08-01
# Last Updated    : 2025-08-01
# ==============================================================================


# 1. Create a directory named data
mkdir data
pwd

# 2. Move the ./rawdata directory to ./data/raw
mv rawdata data/raw
ls
cd data

# 3. List the contents of the ./data/raw directory
pwd
cd raw
ls

# 4. In ./data/processed, create the following directories: server_logs, user_logs, and event_logs
pwd
cd ..
pwd
mkdir processed
ls
cd processed
pwd
mkdir server_logs user_logs event_logs
ls

# 5. Copy all server log files (files with "server" in the name AND a .log extension) from ./data/raw to ./data/processed/server_logs
cd ..
ls
cd raw
ls
cd ..
ls
cp raw/*server*.log processed/server_logs/
cd processed/server_logs
ls

# 6. Repeat the above step for user logs and event logs
pwd
cd ..
cd ..
ls
cp raw/*user*.log processed/user_logs/
cp raw/*event*.log processed/event_logs/
cd processed/user_logs/
ls
cd ..
cd ..
cd processed/event_logs/

# 7. For user privacy, remove all files containing IP addresses (files with "ipaddr" in the filename) from ./data/raw and ./data/processed/user_logs
pwd
cd ~/week1/shell/02_activities/assignments/newproject/data/raw/
rm ./*ipaddr*
cd ~/week1/shell/02_activities/assignments/newproject/data/processed/user_logs
pwd
rm ./*ipaddr*

# 8. Create a file named ./data/inventory.txt that lists all the files in the subfolders of ./data/processed
cd ~/week1/shell/02_activities/assignments/newproject/data/
ls processed/* > inventory.txt


###########################################

echo "Project setup is complete!"
