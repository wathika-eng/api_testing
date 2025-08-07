#!/usr/bin/env bash

# set color variables
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'

# check if OS is Debian-based
if ! command -v apt-get &> /dev/null; then
    echo -e "${RED}This script is intended for Debian-based systems.${NC}"
    exit 1
fi

echo -e "${GREEN}Installing dependencies...${NC}"

sudo apt-get update && sudo apt-get upgrade -y

echo -e "${GREEN}Installing python build dependencies...${NC}"

# check if python build dependencies are already installed
if dpkg -l | grep -q "build-essential"; then
    echo -e "${YELLOW}Python build dependencies are already installed. Skipping installation.${NC}"
else
    sudo apt-get install -y build-essential libssl-dev libffi-dev python3-dev git curl gcc make
    echo -e "${GREEN}Python build dependencies installed successfully.${NC}"
fi

# check if python, pip and pipx are already installed
if command -v python3 &> /dev/null && command -v pip3 &> /dev/null && command -v pipx &> /dev/null && command -v virtualenv &> /dev/null; then
    echo -e "${YELLOW}Python3, pip3 and pipx are already installed. Skipping installation.${NC}"
else
    echo -e "${GREEN}Installing Python 3 and pip, pipx${NC}"
    sudo apt-get install -y python3 python3-pip python3-virtualenv
    sudo apt install pipx
    pipx ensurepath
    sudo pipx ensurepath
fi


# check that python3, pip and pipx are installed
if ! command -v python3 &> /dev/null || ! command -v pip3 &> /dev/null || ! command -v pipx &> /dev/null; then
    echo -e "${RED}Python3, pip3 or pipx installation failed.${NC}"
    exit 1
fi

# check if Go is already installed
if command -v go &> /dev/null; then
    echo -e "${YELLOW}Go is already installed. Skipping installation.${NC}"
else
    echo -e "${GREEN}Installing Go...${NC}"
    # Install Go using webi.sh
    curl -sS https://webi.sh/golang | sh; \
    source ~/.config/envman/PATH.env
    echo -e "${GREEN}Go installed successfully.${NC}"
    mkdir -p ~/.config/envman
    echo 'export PATH="$HOME/.local/bin:$PATH"' > ~/.config/envman/PATH.env
    source ~/.config/envman/PATH.env
    # add go to PATH
    echo 'GOPATH=$HOME/go  PATH=$PATH:/usr/local/go/bin:$GOPATH/bin' >> ~/.bashrc
    echo 'export GOPATH' >> ~/.bashrc
    echo 'export PATH' >> ~/.bashrc
    source ~/.bashrc
fi

# check if Docker is already installed
if command -v docker &> /dev/null; then
    echo -e "${YELLOW}Docker is already installed. Skipping installation.${NC}"
else
    echo -e "${GREEN}Installing Docker...${NC}"
    # clean up any existing Docker installations
    for pkg in docker.io docker-doc docker-compose docker-compose-v2 podman-docker containerd runc; do sudo apt-get remove $pkg; done
    # add docker key
    # Add Docker's official GPG key:
    sudo apt-get update
    sudo apt-get install ca-certificates curl
    sudo install -m 0755 -d /etc/apt/keyrings
    sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
    sudo chmod a+r /etc/apt/keyrings/docker.asc
    
    # Add the repository to Apt sources:
    echo \
    "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
    $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}") stable" | \
    sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
    sudo apt-get update
    # now install Docker:
    sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
    echo -e "${GREEN}Docker installed successfully.${NC}"
    # setup docker permissions
    sudo groupadd docker
    sudo usermod -aG docker $USER
    newgrp docker
fi

# start installing api security tools
echo -e "${GREEN}Installing API security tools...${NC}"

# check and install arjun and mitmproxy
if command -v arjun &> /dev/null && command -v mitmproxy &> /dev/null; then
    echo -e "${YELLOW}Arjun and mitmproxy are already installed. Skipping installation.${NC}"
else
    echo -e "${GREEN}Installing Arjun and mitmproxy...${NC}"
    pipx install arjun
    pipx install mitmproxy
    if ! command -v arjun &> /dev/null || ! command -v mitmproxy &> /dev/null; then
        echo -e "${RED}Arjun or mitmproxy installation failed.${NC}"
        exit 1
    fi
fi

# install Gobuster
echo -e "${GREEN}Installing Gobuster...${NC}"
go install github.com/OJ/gobuster/v3@latest
# check if Gobuster is installed
if ! command -v gobuster &> /dev/null; then
    echo -e "${RED}Gobuster installation failed.${NC}"
    exit 1
fi

# install Nuclei
# echo -e "${GREEN}Installing Nuclei...${NC}"
# go install -v github.com/projectdiscovery/nuclei/v3/cmd/nuclei@latest
# # check if Nuclei is installed
# if ! command -v nuclei &> /dev/null; then
#     echo -e "${RED}Nuclei installation failed.${NC}"
#     exit 1
# fi

# install HTTPX
# echo -e "${GREEN}Installing HTTPX...${NC}"
# go install -v github.com/projectdiscovery/httpx/cmd/httpx@latest
# # check if HTTPX is installed
# if ! command -v httpx &> /dev/null; then
#     echo -e "${RED}HTTPX installation failed.${NC}"
#     exit 1
# fi

# install kiterunner
# check if kiterunner is already installed
# if command -v kiterunner &> /dev/null; then
#     echo -e "${YELLOW}Kiterunner is already installed. Skipping installation.${NC}"
# else
#     echo -e "${GREEN}Installing Kiterunner...${NC}"
#     curl -L -o kiterunner.tar.gz https://github.com/assetnote/kiterunner/releases/download/v1.0.2/kiterunner_1.0.2_linux_amd64.tar.gz
#     tar -xzf kiterunner.tar.gz
#     sudo mv kiterunner /usr/local/bin/
#     # check if Kiterunner is installed
#     if ! command -v kiterunner &> /dev/null; then
#         echo -e "${RED}Kiterunner installation failed.${NC}"
#         exit 1
#     fi
# fi

source snap_tools.sh

source vuln.sh
# end
echo -e "${GREEN}All API security tools installed successfully.${NC}"