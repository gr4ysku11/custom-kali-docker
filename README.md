# custom-kali-docker
Custom Kali docker image utilizing Kasm for browser streaming

### Installation
- pull in docker image from github
```bash
$ docker pull ghcr.io/gr4ysku11/kasmkali:test
$ docker run --rm  -it --shm-size=512m -p 6901:6901 -e VNC_PW=password ghcr.io/gr4ysku11/kasmkali:test
```
- browse to https://localhost:6901
- login using "kasm_user:password"
