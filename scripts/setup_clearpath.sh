#!/bin/bash
set -e

mkdir ~/clearpath_ws/src -p
source /opt/ros/jazzy/setup.bash
cd ~/clearpath_ws

# Import Clearpath repositories
wget https://raw.githubusercontent.com/clearpathrobotics/clearpath_simulator/jazzy/dependencies.repos
vcs import src < dependencies.repos

# Initialize and update rosdep
if [ ! -f /etc/ros/rosdep/sources.list.d/20-default.list ]; then
    sudo rosdep init
fi
rosdep update

# Install ROS dependencies
rosdep install -r --from-paths src -i -y

# Build workspace
colcon build --symlink-install

mkdir -p /workspaces/jackal_ws/clearpath