#!/bin/bash
set -e

# Setup Development Environment
source /opt/ros/humble/setup.bash
source /home/autodrive_devkit/install/setup.bash

# AutoDRIVE Devkit Workspace
cd /home/autodrive_devkit

# Launch AutoDRIVE Devkit with GUI
# ros2 launch autodrive_roboracer bringup_graphics.launch.py

# Launch AutoDRIVE Devkit Headless
ros2 launch autodrive_roboracer bringup_headless.launch.py &
PID1=$!

# Launch our agent and save the PID
ros2 run ftg_algorithm controller_node &
PID2=$!

wait -n

# Kill both process if one of it encountered errors
kill $PID1 2>/dev/null
kill $PID2 2>/dev/null

wait
