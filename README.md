# Go Docker Image for go build server using specific go version
FROM centos:7
change GO_VERSION to specific go version

# Additional

oracle instant client 21 installed

# Command Note
//build base image
sudo docker build . --tag fishjerky/golang:1.16.5

//save image
docker save -o go-build-1.16.5.tar fishjerky/golang:1.16.5
