# ROS Version
FROM osrf/ros:jazzy-desktop-full

ENV DEBIAN_FRONTEND=noninteractive

# Clearpath Setup Script
COPY scripts/setup_clearpath.sh /scripts/setup_clearpath.sh/

# General Dependencies
RUN apt-get update && apt-get install -y \
    curl \
    nano \
    wget \
    sudo \
    python3-pip \
    python3-colcon-common-extensions \
    python3-rosdep \
    python3-vcstool \
    mesa-utils \
    && rm -rf /var/lib/apt/lists/*

# Clearpath Packages
RUN apt-get update && apt-get install -y \
    ros-jazzy-ros-gz \
    ros-jazzy-clearpath-simulator \
    && rm -rf /var/lib/apt/lists/*

# Non-root user
ARG USERNAME=ubuntu

# Setup sudo
RUN echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME \
    && chmod 0440 /etc/sudoers.d/$USERNAME \
    && rm -rf /var/lib/apt/lists/*

# Set user to ubuntu i/o root
USER ubuntu

# ROS environment
RUN echo "source /opt/ros/jazzy/setup.bash" >> /home/${USERNAME}/.bashrc
# Build workspace if built before
RUN echo 'if [ -f /workspaces/jackal_ws/install/setup.bash ]; then source /workspaces/jackal_ws/install/setup.bash; fi' >> /home/${USERNAME}/.bashrc

# NVIDIA Optimus
RUN echo 'export __NV_PRIME_RENDER_OFFLOAD=1' >> /home/${USERNAME}/.bashrc
RUN echo 'export __GLX_VENDOR_LIBRARY_NAME=nvidia' >> /home/${USERNAME}/.bashrc
RUN echo 'export NVIDIA_DRIVER_CAPABILITIES=all' >> /home/${USERNAME}/.bashrc

CMD [ "$PWD" ]