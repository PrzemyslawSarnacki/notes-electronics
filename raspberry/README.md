```
sudo apt-get remove docker docker-engine docker.io containerd runc

sudo apt-get update

sudo apt-get install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release

curl -sSL https://get.docker.com | sh
```

```
sudo usermod -aG docker $USER
```

```
sudo apt install docker-compose
```
To run portainer you can either run this command:
```
docker run -d -p 9000:9000 -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce:linux-arm64
```
or just use docker-compose using attached `docker-compose.yaml` file

```
docker-compose up
```
