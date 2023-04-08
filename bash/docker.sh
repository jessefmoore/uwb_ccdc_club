echo "updates via apt"
sudo apt update -y
echo "Install docker"
sudo apt install docker.io -y
sudo systemctl start docker.service
sudo systemctl enable docker.service
echoo "Docker version"
sudo docker version
sudo usermod -aG docker $USER
echo "aaaaaaaaaaahhhhhhhhhhhhhhhh REBOOT"
sudo reboot
