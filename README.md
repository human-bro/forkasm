# forkasm
this repository is used create docker image that run different linux os and make it available on browser 

run this to deploy a ubuntu docker image on 3001 port   
```bash
docker run -d --name=ubuntu-container --security-opt seccomp=unconfined -e PUID=1000 -e PGID=1000 -e TZ=Etc/UTC -e SUBFOLDER=/ -e TITLE="Ubuntu Container" -p 3011:3000 -p 3009:3001 --device /dev/dri:/dev/dri --shm-size="1gb" --restart unless-stopped ubuntu-custom
``` python
docker run -d -- name=firefox -- security-opt seccomp=unconfined '#optional' -e PUID=1000 -e PGID=1000 -e TZ=Etc/UTC \ -e FIREFOX_CLI=https://academy.networkchuck.com/ -p 3000:3000 -p 3001:3001 -- shm-size="1gb" -- restart unless-stopped lscr.io/linuxserver/firefox:latest
```