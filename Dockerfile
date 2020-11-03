FROM balenalib/aarch64-ubuntu:bionic
ARG DEBIAN_FRONTEND=noninteractive

# Update Packages
RUN apt-get update
RUN apt-get install -y apt-utils

# Install ROS Package Keys
RUN apt-get install -y curl gnupg2 apt-transport-https gnupg ca-certificates 
RUN sh -c 'echo "deb http://packages.ros.org/ros/ubuntu bionic main" > /etc/apt/sources.list.d/ros-latest.list'
RUN apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654
RUN curl -sSL 'http://keyserver.ubuntu.com/pks/lookup?op=get&search=0xC1CF6E31E6BADE8868B172B4F42ED6FBAB17C654' | apt-key add -

# Update package repo for ROS
RUN apt-get update

# Install ROS
RUN apt-get install -y humanity-icon-theme
RUN apt-get install -y ros-melodic-ros-base
RUN apt-get install -y python3.6 python3-pip python3-yaml python3-empy python3-netifaces
RUN apt-get install -y python-rosdep python-rosinstall python-rosinstall-generator python-wstool build-essential cmake wget unzip vim

# Install Python Packages
RUN pip3 install rospkg catkin_pkg

# Configure Enviroment for ROS
RUN echo "source /opt/ros/melodic/setup.bash" >> ~/.bashrc

# Init ROS
RUN rosdep init
RUN rosdep update

CMD sleep infinity
