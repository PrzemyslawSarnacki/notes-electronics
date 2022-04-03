# Raspberry Pi setup

## Raspbian setup

Download imager from:
```
https://www.raspberrypi.com/software/
```
or via brew: 
```
brew install --cask raspberry-pi-imager
```
or apt-get using Linux:
```
sudo apt-get install raspberry-pi-imager
```

I've chosen 64 bit Lite version while using RPi 4B 8GB.
Load it into the SD card and turn on the Pi.

## Docker Setup

Download yaml file:
```
curl -L https://raw.githubusercontent.com/PrzemyslawSarnacki/notes-electronics/master/raspberry/docker-compose.yaml --output docker-compose.yaml
```
Dowload all the prerequisities and the docker itself along with docker-compose:
```
sudo apt-get remove docker docker-engine docker.io containerd runc

sudo apt-get update

sudo apt-get install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release

curl -sSL https://get.docker.com | sh
sudo apt install docker-compose
```

Add docker to the group
```
sudo usermod -aG docker $USER
```

To run portainer you can either run this command:
```
docker run -d -p 9000:9000 -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce:linux-arm64
```
or just use docker-compose using attached `docker-compose.yaml` file

```
sudo docker-compose up
```

After all of that home assistant will be available on the `http://RASPBERRY_PI_IP:8123` or `http://raspberry.local:8123`
I'm not sure why on Android `.local` domains are not working. 

## Zsh instead of bash (optional)
This is completely unnecessary but I can't help with myself prefering zsh over bash
Install zsh:
```
sudo apt-get install zsh 
```

Install oh-my-zsh
```
git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
```

Install some external plugins:
```
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions

git clone https://github.com/zsh-users/zsh-completions ~/.oh-my-zsh/custom/plugins/zsh-completions

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh/zsh-syntax-highlighting
```
Set Zsh as your default shell:
```
chsh -s /bin/zsh
```

Add to the .zshrc
```
plugins=(
  colored-man-pages
  extract
  git
  github
)

source $ZSH/oh-my-zsh.sh
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fpath=(/usr/local/share/zsh-completions $fpath)
autoload -Uz compinit
```