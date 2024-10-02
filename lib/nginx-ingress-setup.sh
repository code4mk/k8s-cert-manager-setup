#!/bin/bash

# ANSI color codes
GREEN_BG='\033[42m'  # Green background
RESET_COLOR='\033[0m' # Reset to default color

# Function to echo with green background
print_green_bg() {
  echo -e "${GREEN_BG}$1${RESET_COLOR}"
}

# Add the Ingress NGINX Helm repository
print_green_bg "Adding Ingress NGINX Helm repository..."
helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx

# Update Helm repositories
print_green_bg "Updating Helm repositories..."
helm repo update

# Install Ingress NGINX
print_green_bg "Installing Ingress NGINX..."
helm install nginx-ingress ingress-nginx/ingress-nginx \
  --namespace ingress-nginx \
  --create-namespace \
  --set controller.publishService.enabled=true

print_green_bg "Ingress NGINX installation completed."