#!/bin/bash

# ANSI color codes
GREEN_BG='\033[42m'  # Green background
RESET_COLOR='\033[0m' # Reset to default color

# Function to echo with green background
print_green_bg() {
  echo -e "${GREEN_BG}$1${RESET_COLOR}"
}

# Add Jetstack Helm repository
print_green_bg "Adding Jetstack Helm repository..."
helm repo add jetstack https://charts.jetstack.io

# Install Cert-Manager
print_green_bg "Installing Cert-Manager..."
helm install \
  cert-manager jetstack/cert-manager \
  --namespace cert-manager \
  --create-namespace \
  --version v1.13.2 \
  --set installCRDs=true

print_green_bg "Cert-Manager installation complete."
