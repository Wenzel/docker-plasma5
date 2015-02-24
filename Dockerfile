FROM ubuntu:14.10

# Add kubuntu-next repo
RUN echo 'deb http://ppa.launchpad.net/kubuntu-ppa/next/ubuntu utopic main' >> /etc/apt/sources.list.d/kubuntu-next.list

# Update repo
RUN apt-key adv --recv-keys --keyserver keyserver.ubuntu.com 2836CB0A8AC93F7A && \
    apt-get update

# Install plasma5
RUN apt-get install -y kubuntu-plasma5-desktop && \
    apt full-upgrade -y

# Create simple user
RUN useradd -d /home/kdedev -m kdedev
USER kdedev
WORKDIR /home/kdedev

# Run KDE at startup
CMD ["/usr/bin/startkde"]
