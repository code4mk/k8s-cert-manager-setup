#!/bin/bash

# ANSI color codes
GREEN_BG='\033[42m'  # Green background
RESET_COLOR='\033[0m' # Reset to default color

# Function to echo with green background
print_green_bg() {
  echo -e "${GREEN_BG}$1${RESET_COLOR}"
}

# Function to install Nginx Ingress
install_nginx_ingress() {
  print_green_bg "Running Nginx Ingress setup script..."
  ./lib/nginx-ingress-setup.sh
}

# Function to install Cert-Manager
install_cert_manager() {
  print_green_bg "Running Cert-Manager setup script..."
  ./lib/cert-manager-setup.sh
}

# Main script execution starts here

echo "Welcome to Kubernetes setup script!"

# Prompt user to choose an option
echo "Please select an option:"
echo "1. Setup Nginx Ingress"
echo "2. Setup Cert-Manager"
echo "3. Exit"

read -p "Enter your choice [1-3]: " choice

case $choice in
  1)
    install_nginx_ingress
    ;;
  2)
    install_cert_manager
    ;;
  3)
    echo "Exiting setup script."
    exit 0
    ;;
  *)
    echo "Invalid choice. Please enter a number between 1 and 3."
    ;;
esac

echo "Setup process complete."
