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
  local name=$1
  local namespace=$2
  local ingress_class=$3

  print_green_bg "Installing Nginx Ingress Controller: $name in namespace: $namespace with ingress class: $ingress_class"

  # Check if namespace exists, create if necessary
  if ! kubectl get namespace "$namespace" &> /dev/null; then
    print_green_bg "Namespace $namespace does not exist, creating..."
    kubectl create namespace "$namespace"
  else
    print_green_bg "Namespace $namespace already exists."
  fi

  # Install Nginx Ingress using Helm
  helm install "$name" ingress-nginx/ingress-nginx \
    --namespace "$namespace" \
    --set controller.service.type=LoadBalancer \
    --set controller.ingressClassResource.name="$ingress_class" \
    --set controller.ingressClassResource.controllerValue="$ingress_class-controller"
}

# Prompt for nginx Ingress controller service name
read -p "Enter the service name for the nginx ingress: " SERVICE_NAME
PREFIX="dockman"
NGINX_INGRESS_NAMESPACE="${PREFIX}-ingress"
NGINX_INGRESS_CLASS="${PREFIX}-${SERVICE_NAME}-nginx"

# Install the Nginx Ingress controller
install_nginx_ingress "$SERVICE_NAME" "$NGINX_INGRESS_NAMESPACE" "$NGINX_INGRESS_CLASS"

print_green_bg "Nginx Ingress Controller installation complete."
