# Installing Jenkins on ubuntu 20.04
#!/bin/bash

echo "========================================================="
echo "Installation of git"
sudo apt-get update -y
sudo apt install git
git --version
echo "Git installation complete"

echo "========================================================="
echo "Installation of Docker"
sudo apt-get remove docker docker-engine docker.io containerd runc
sudo apt-get update -y

sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
 echo \
  "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt-get update -y
sudo apt-get install docker-ce docker-ce-cli containerd.io -y
docker -v
sudo docker run hello-world
echo "Docker installation complete"
echo "========================================================="

echo "Install Java JDK 8"
sudo apt update -y
echo "search of all available packages:"

sudo add-apt-repository ppa:webupd8team/java
sudo apt install oracle-java8-installer
wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -
sudo apt-add-repository "deb https://pkg.jenkins.io/debian-stable binary/"

echo "checking installation:"
java -version
echo "Java jdk installation complete"
echo "========================================================="

echo "Install Long Term Support release Jenkins:"
wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -
sudo sh -c 'echo deb https://pkg.jenkins.io/debian-stable binary/ > \
    /etc/apt/sources.list.d/jenkins.list'
sudo apt-get update -y
sudo apt-get install jenkins -y

echo "Start Jenkins"
sudo systemctl start jenkins

echo "Status of Jenkins"
sudo systemctl status jenkins

echo "Unlock Jenkins with initial admin password"
sudo cat /var/lib/jenkins/secrets/initialAdminPassword

echo "========================================================="