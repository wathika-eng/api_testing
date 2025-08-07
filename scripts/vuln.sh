#!/bin/bash

GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Check if Juice Shop image exists
if docker image inspect bkimminich/juice-shop:latest > /dev/null 2>&1; then
    echo -e "${GREEN}OWASP Juice Shop image already exists.${NC}"
else
    echo -e "${GREEN}Downloading OWASP Juice Shop...${NC}"
    if docker pull bkimminich/juice-shop; then
        echo -e "${GREEN}OWASP Juice Shop downloaded successfully.${NC}"
    else
        echo -e "${RED}Failed to download OWASP Juice Shop.${NC}"
        exit 1
    fi
fi

# Check if container named 'juice-shop' exists
if docker ps -a --format '{{.Names}}' | grep -q '^juice-shop$'; then
    echo -e "${GREEN}Container 'juice-shop' already exists.${NC}"
else
    echo -e "${GREEN}Creating persistent container 'juice-shop'...${NC}"
    docker create \
    --name juice-shop \
    -p 3000:3000 \
    bkimminich/juice-shop > /dev/null
    
    if [ $? -eq 0 ]; then
        echo -e "${GREEN}Container 'juice-shop' created successfully.${NC}"
    else
        echo -e "${RED}Failed to create container 'juice-shop'.${NC}"
        exit 1
    fi
fi

echo -e "${GREEN}You can now start it with: docker start juice-shop${NC}"
echo -e "${GREEN}And stop it with: docker stop juice-shop${NC}"
