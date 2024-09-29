# forkasm
this repository is used create docker image that run different linux os and make it available on browser 

run this to deploy a ubuntu docker image on 3001 port   
```bash
docker run -d --name=ubuntu-container --security-opt seccomp=unconfined -e PUID=1000 -e PGID=1000 -e TZ=Etc/UTC -e SUBFOLDER=/ -e TITLE="Ubuntu Container" -p 3011:3000 -p 3010:3002 --device /dev/dri:/dev/dri --shm-size="1gb" --restart unless-stopped ubuntu-custom
```
# For launching firefox
``` 
docker run -d --name=firefox --security-opt seccomp=unconfined -e PUID=1000 -e PGID=1000 -e TZ=Etc/UTC -e FIREFOX_CLI=https://google.com -p 3000:3000 -p 3001:3001 --shm-size="1gb" --restart unless-stopped lscr.io/linuxserver/firefox:latest
```


# For launching linux

```
docker run -d --name=kali-linux --security-opt seccomp=unconfined -e PUID=1000 -e PGID=1000 -e TZ=Etc/UTC -e SUBFOLDER=/ -e TITLE="Kali Linux" -p 3011:3000 -p 3009:3001 --device /dev/dri:/dev/dri --shm-size="1gb" --restart unless-stopped linuxserver/nextcloud 
```

## To host next cloud server
```
docker run -d --name=nextcloud --security-opt seccomp=unconfined -e PUID=1000 -e PGID=1000 -e MYSQL_PASSWORD=password -e NEXTCLOUD_ADMIN_USER=admin -e NEXTCLOUD_ADMIN_PASSWORD=admin_password -e TZ=Etc/UTC -p 3011:80 -p 3009:443 --restart unless-stopped -v nextcloud_data:/var/www/html nextcloud
```
### [click here ](https://fleet.linuxserver.io/) to select more images 

## For launching windows
```
docker run -d --name=windows-container --security-opt seccomp=unconfined -e PUID=1000 -e PGID=1000 -e TZ=Etc/UTC -p 3011:80 -p 3009:81 --restart unless-stopped 
```
zixia/windows
# Important docker commands

## To search container images using its name like if you want search about windows images you to pull or alternative images 

```
docker search windows  # here windows is the image name it can be anything 
```

## To pull images 

```
docker pull image_name
```

## to create container and run
```
docker run # to create and run 
```



docker run -d --name=window-container --restart unless-stopped -p 3011:80 -p 3009:81 mcr.microsoft.com/windows/servercore:ltsc2022


## To Stop container

```
docker stop firefox # container name or id
```

## If you want restart the container

```
docker start firefox
```

## To list the containers

```
docker ps  # to list all of the running containers
docker ps -a # to list all the containers even the stoped ones
```

## To get only there containers ids which could be usefull while you want to do same operations on multiple containers 

```
docker ps -q
docker ps - aq # to get the id of stoped containers
```

## To get all the container names 

```
docker ps -a --format "{{.Names}}"
```

## To search for a image by name 
```
docker search image_name
```

## To list all the existing pulled images 

```
docker images 
```

## To list all pulled images ids

```
docker images -q
```

## To delete all the images

```
docker image prune # To remove unused images
docker image prune -a # all the images
```

## To stop all running containers 

```
docker stop $(docker ps -q) # here '$' is very important
```

## To remove all container
```
docker rm $(docker ps -q) # all running container
docker rm $(docker ps -aq) # includes running and stoped ones also
```

## To forefully remove the container

```
docker rm -f $(docker ps -q)
```

## To delete all containers except the running ones or delete all the unused images this will also delete the containers which are not in use
```
docker system prune 
docker system prune -a # Remove all unused images not just dangling ones
```


# if you want make the link public of kali linux 

## setting up ngrok
```
curl -sSL https://ngrok-agent.s3.amazonaws.com/ngrok.asc \
	| sudo tee /etc/apt/trusted.gpg.d/ngrok.asc >/dev/null \
	&& echo "deb https://ngrok-agent.s3.amazonaws.com buster main" \
	| sudo tee /etc/apt/sources.list.d/ngrok.list \
	&& sudo apt update \
	&& sudo apt install ngrok
```

## you can get authtoken when login to ngrok.com and replace AUTHTOKEN WITH THE ACTUAL TOKEN

```
ngrok config add-authtoken AUTHTOKEN
```

## To serve it now

```
ngrok http 3011
```
## here 3011 is the port number in which you hosted the kali linux in

## now go to ngrok.com and then click on endpoints and then a new link will come that you can use this link anywhere untill codespace is active
