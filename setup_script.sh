# variables
user=$(whoami)

# curl
echo "Installing cURL"
echo | sudo apt install curl
echo | sudo apt-get update && echo | sudo apt-get upgrade

# git
echo  "Installing Git\n"
echo | sudo add-apt-repository ppa:git-core/ppa 
echo | sudo apt update && echo | apt install git -y
git config --global user.name "Garvit K Rai"
git config --global user.email "garvitrai013@gmail.com"

# zsh
echo "Installing Zsh"
cp zsh/.zshrc ~
echo | sudo apt install zsh
chsh -s $(which zsh)

# zsh plugins
echo "Installing Oh My Zsh"
sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
echo "Installing powerlevel10k"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc

# github cli
echo "Installing GitHub CLI\n"
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null
echo | sudo apt update
echo | sudo apt install gh

# snap
echo "Installing Snap"
echo | sudo apt install snapd
echo | sudo apt update && echo | sudo apt upgrade

# vscode
echo "Installing VSCode"
echo | sudo snap install code --classic

# android studio
sudo snap install android-studio --classic
echo | sudo apt-get install cpu-checker
cpu_check=$(egrep -c '(vmx|svm)' /proc/cpuinfo)
if [ $cpu_check -gt 0 ]
then
    kvm-ok
    echo | sudo apt-get install qemu-kvm libvirt-daemon-system libvirt-clients bridge-utils
else
    echo "Hardware acceleration cannot be implemented\n"
fi

# linuxbrew
echo "Installing Brew"
echo | sudo apt-get install build-essential
echo "\n" | /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# diff-so-fancy
echo "Installing diff-so-fancy"
brew install diff-so-fancy

# asdf
echo "Installing asdf"
brew install asdf
echo -e "\n. $(brew --prefix asdf)/libexec/asdf.zsh" >> ${ZDOTDIR:-~}/.zshrc

# gcc
echo "Installing gcc"
brew install gcc

# python
echo "Installing Python"
asdf plugin-add python
asdf install python latest

# java
echo "Installing Java"
asdf plugin-add java https://github.com/halcyon/asdf-java.git
asdf install java latest

# node
echo "Installing NodeJS"
brew install gpg
asdf plugin-add nodejs https://github.com/asdf-vm/asdf-nodejs.git
asdf install nodejs latest

# dart
echo "Installing Dart"
brew install openssl readline
asdf plugin-add dart https://github.com/patoconnor43/asdf-dart.git
asdf install dart latest
echo "export PATH=\"$(asdf where flutter)/bin\":\"$PATH\""

# flutter
echo "Installing Flutter"
asdf plugin-add flutter 
asdf install flutter latest

# chrome
echo "Installing Google Chrome"
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
echo | sudo apt install ./google-chrome-stable_current_amd64.deb

# zoom
echo "Installing Zoom"
sudo snap install zoom-client --classic

# slack
echo "Installing Slack"
sudo snap install slack --classic

#spotify
echo "Installing Spotify"
sudo snap install spotify --classic

# office365 web
echo "Installing Office 365 Web"
sudo snap install office365webdesktop --classic

# vlc
echo "Installing VLC"
sudo snap install vlc --classic

# gnome tweaks
echo "Installing Gnome Tweaks"
echo | sudo apt install gnome-tweaks --yes

# ulauncher
echo "Installing Ulauncher"
echo | sudo add-apt-repository ppa:agornostal/ulauncher && echo | sudo apt update && echo | sudo apt install ulauncher

# tlp
echo "Installing TLP"
echo | sudo add-apt-repository ppa:linrunner/tlp
echo | sudo apt update
echo "y\n" | sudo apt install tlp tlp-rdw