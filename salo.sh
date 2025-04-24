#!/bin/bash

echo "🛠 Installing DevOps pilot setup..."

# Update & basic tools
sudo apt update && sudo apt upgrade -y
sudo apt install -y curl wget git htop btop zsh flatpak gnome-software-plugin-flatpak

# Install VS Code
flatpak install -y flathub com.visualstudio.code

# Set Flatpak path (optional, for GUI)
flatpak update

# Install Oh My Zsh
echo "🌀 Installing Oh My Zsh..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Powerlevel10k theme
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.oh-my-zsh/custom/themes/powerlevel10k

# Set theme in .zshrc
sed -i 's/ZSH_THEME=.*/ZSH_THEME="powerlevel10k\/powerlevel10k"/' ~/.zshrc

# Add aliases
cat << 'EOF' >> ~/.zshrc

# Custom aliases
alias gs='git status'
alias ga='git add .'
alias gc='git commit -m'
alias gp='git push'
alias ..='cd ..'
alias dc='docker compose'
alias tf='terraform'
alias k='kubectl'

# ASCII Banner
cat << "BANNER"

🛫 Welcome, Maks – DevOps Pilot ☀️
-----------------------------------
🌤 Light mode: ON
💻 Terminal: Ready
🚀 Tools loaded, engines running!

BANNER

EOF

# Install Docker
echo "🐳 Installing Docker..."
curl -fsSL https://get.docker.com | sudo sh
sudo usermod -aG docker $USER

# Install Docker Compose plugin
mkdir -p ~/.docker/cli-plugins/
curl -SL https://github.com/docker/compose/releases/download/v2.24.2/docker-compose-linux-x86_64 -o ~/.docker/cli-plugins/docker-compose
chmod +x ~/.docker/cli-plugins/docker-compose

# Install Terraform
echo "🌍 Installing Terraform..."
wget https://releases.hashicorp.com/terraform/1.8.1/terraform_1.8.1_linux_amd64.zip
unzip terraform_1.8.1_linux_amd64.zip
sudo mv terraform /usr/local/bin/
rm terraform_1.8.1_linux_amd64.zip

# Install kubectl
echo "☸️ Installing kubectl..."
curl -LO "https://dl.k8s.io/release/$(curl -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
chmod +x kubectl
sudo mv kubectl /usr/local/bin/

# Install AWS CLI
echo "☁️ Installing AWS CLI..."
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
rm -rf aws awscliv2.zip

# Finish
echo "✅ Done! Restart your terminal or run 'zsh' now ✨"
