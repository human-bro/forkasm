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
