curl -L https://raw.githubusercontent.com/PrzemyslawSarnacki/notes-electronics/master/raspberry/docker-compose.yaml --output docker-compose.yaml
sudo apt-get remove docker docker-engine docker.io containerd runc
sudo apt-get update
sudo apt-get install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release

curl -sSL https://get.docker.com | sh
sudo apt install docker-compose
sudo usermod -aG docker $USER
sudo docker-compose up