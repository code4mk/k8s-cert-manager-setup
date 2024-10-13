# k8s-cert-manager-setup
kubernetes tls/ssl setup with cert-manager and ingress-nginx

# Setup Scripts

This repository contains scripts to simplify the setup of common Kubernetes components, specifically Nginx Ingress and Cert-Manager.

## Project Structure

```
.
├── README.md
├── lib
│   ├── cert-manager-setup.sh
│   └── nginx-ingress-setup.sh
└── setup.sh
```

## Scripts

### setup.sh

This is the main script that provides a user interface for selecting which component to install. It offers the following options:

1. Setup Nginx Ingress
2. Setup Cert-Manager
3. Exit

### lib/nginx-ingress-setup.sh

This script installs and configures Nginx Ingress on your Kubernetes cluster.

### lib/cert-manager-setup.sh

This script installs and configures Cert-Manager on your Kubernetes cluster.

## Usage

1. Clone this repository:
   ```
   git clone https://github.com/code4mk/k8s-cert-manager-setup.git
   cd k8s-cert-manager-setup
   ```

2. Make the scripts executable:
   ```
   chmod +x setup.sh lib/*.sh
   ```

3. Run the main setup script:
   ```
   ./setup.sh
   ```

4. Follow the on-screen prompts to select which component you want to set up.

## Requirements

- A running Kubernetes cluster
- `kubectl` configured to communicate with your cluster
- `helm` installed on your local machine

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

[MIT License](LICENSE)
