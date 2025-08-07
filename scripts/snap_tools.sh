#!/usr/bin/env bash

echo -e "${GREEN}the below tools will be installed via snap...${NC}"
# install snapd if not installed
if ! command -v snap &> /dev/null; then
    echo -e "${YELLOW}Snap is not installed. Installing Snap...${NC}"
    sudo apt-get install -y snapd
    # check if Snap is installed
    if ! command -v snap &> /dev/null; then
        echo -e "${RED}Snap installation failed.${NC}"
        exit 1
    fi
else
    echo -e "${YELLOW}Snap is already installed. Skipping installation.${NC}"
fi


# install postman
# check if Postman is already installed
if command -v postman &> /dev/null; then
    echo -e "${YELLOW}Postman is already installed. Skipping installation.${NC}"
else
    echo -e "${GREEN}Installing Postman...${NC}"
    sudo snap install postman
    # check if Postman is installed
    if ! command -v postman &> /dev/null; then
        echo -e "${RED}Postman installation failed.${NC}"
        exit 1
    fi
fi

# install nmap
# check if Nmap is already installed
if command -v nmap &> /dev/null; then
    echo -e "${YELLOW}Nmap is already installed. Skipping installation.${NC}"
else
    echo -e "${GREEN}Installing Nmap...${NC}"
    sudo snap install nmap
    # check if Nmap is installed
    if ! command -v nmap &> /dev/null; then
        echo -e "${RED}Nmap installation failed.${NC}"
        exit 1
    fi
fi

# install amass
# check if Amass is already installed
if command -v amass &> /dev/null; then
    echo -e "${YELLOW}Amass is already installed. Skipping installation.${NC}"
else
    echo -e "${GREEN}Installing Amass...${NC}"
    sudo snap install amass
    # check if Amass is installed
    if ! command -v amass &> /dev/null; then
        echo -e "${RED}Amass installation failed.${NC}"
        exit 1
    fi
fi

# install java for burp suite and owasp zap
# check if Java is already installed
if command -v java &> /dev/null; then
    echo -e "${YELLOW}Java is already installed. Skipping installation.${NC}"
else
    echo -e "${GREEN}Installing Java...${NC}"
    # install sdk manager
    # check if sdk is already installed
    if ! command -v sdk &> /dev/null; then
        curl -s "https://get.sdkman.io" | bash
        source "$HOME/.sdkman/bin/sdkman-init.sh"
        sdk install java 21.0.2-tem
    else
        echo -e "${YELLOW}SDKMAN is already installed. Skipping installation.${NC}"
    fi
    # check if Java is installed
    if ! command -v java &> /dev/null; then
        echo -e "${RED}Java installation failed.${NC}"
        exit 1
    fi
fi

