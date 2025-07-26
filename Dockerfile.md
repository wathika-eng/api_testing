```dockerfile
FROM kalilinux/kali-rolling

ENV DEBIAN_FRONTEND=noninteractive

# Update and install base packages
RUN apt update -y && \
    apt upgrade -y && \
    apt dist-upgrade -y && \
    apt install -y \
    sudo \
    zsh \
    burpsuite \
    git \
    docker.io \
    docker-compose \
    golang-go \
    python3-pip \
    wget \
    unzip \
    zaproxy \
    make \
    build-essential \
    curl && \
    apt clean

# Set up new user hapihacker
RUN useradd -m hapihacker && \
    usermod -a -G sudo hapihacker && \
    chsh -s /bin/zsh hapihacker

RUN cd /opt && \
    git clone https://github.com/assetnote/kiterunner.git && \
    cd kiterunner && \
    make build && \
    ln -s /opt/kiterunner/dist/kr /usr/bin/kr

# Download wordlists
RUN cd /opt && \
    wget -c https://github.com/danielmiessler/SecLists/archive/master.zip -O SecList.zip && \
    unzip SecList.zip && \
    rm -f SecList.zip

RUN cd /opt && \
    wget -c https://github.com/hAPI-hacker/Hacking-APIs/archive/refs/heads/main.zip -O HackingAPIs.zip && \
    unzip HackingAPIs.zip && \
    rm -f HackingAPIs.zip

# Create volume mount points
VOLUME ["/home/hapihacker"]

# Default command
CMD ["/bin/zsh"]
```