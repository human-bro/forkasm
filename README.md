# forkasm
this repository is used create docker image that run different linux os and make it available on browser 

run this to deploy a ubuntu docker image on 3001 port   
```bash
docker run -d --name=ubuntu-container --security-opt seccomp=unconfined -e PUID=1000 -e PGID=1000 -e TZ=Etc/UTC -e SUBFOLDER=/ -e TITLE="Ubuntu Container" -p 3011:3000 -p 3010:3002 --device /dev/dri:/dev/dri --shm-size="1gb" --restart unless-stopped ubuntu-custom
```
# for launching firefox
``` 
docker run -d -- name=firefox -- security-opt seccomp=unconfined '#optional' -e PUID=1000 -e PGID=1000 -e TZ=Etc/UTC \ -e FIREFOX_CLI=https://academy.networkchuck.com/ -p 3000:3000 -p 3001:3001 -- shm-size="1gb" -- restart unless-stopped lscr.io/linuxserver/firefox:latest
```
# for launching linux

```
docker run -d --name=kali-linux --security-opt seccomp=unconfined -e PUID=1000 -e PGID=1000 -e TZ=Etc/UTC -e SUBFOLDER=/ -e TITLE="Kali Linux" -p 3011:3000 -p 3009:3001 --device /dev/dri:/dev/dri --shm-size="1gb" --restart unless-stopped lscr.io/linuxserver/kali-linux:latest
```

# Important docker commands

## to create container and run
```
docker run # to create and run 
```

## to list the containers

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

## To list all the existing pulled images 

```
docker images 
```

## To list all pulled images ids

```
docker images -q
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
docker rm -f ($docker ps -q)
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
