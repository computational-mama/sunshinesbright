+++
date = '2025-04-15T12:38:01+05:30'
draft = false
title = 'How'
summary = ""
lang= "en"
authors= [""]
categories= [""]
tags= [""]
unlisted=true
featured_image= "openwebui.png"
+++

## Setup Raspberry Pi

Head to the Raspberry Pi Software page below and install Raspberry Pi Imager:
https://www.raspberrypi.com/software/

Flash your SD card
- Plug in the SD card in another computer
- Open the installer
- You can follow along the steps in the installer
- The SD card will be ejected once the OS is flashed

{{% figure src="imager.png" %}} rpi imager  {{% /figure %}}

- Insert the SD Card in the raspberry pi card slot
- Plug in the Raspberry Pi
- Wait for about 3-6 mins

After the installation we will `ssh` into the pi remotely.
The username and piname are fixed in the settings when you are flashing the sd card.

{{% figure src="settings.jpg" %}} settings {{% /figure %}}

```bash
ssh <yourusername>@<yourpiname>.local
```

```
sudo apt update
sudo apt upgrade
```


## Install docker and portainer via pi-hosted

```bash
wget -qO- https://raw.githubusercontent.com/pi-hosted/pi-hosted/master/install_docker.sh | bash
```

Or if you have to read through the scripts you clone the pi-hosted GitHub here and install via the script.

Steps for that are:

```
git clone https://github.com/pi-hosted/pi-hosted
cd pi-hosted
./install_docker.sh
```

To install portainer

```
sudo reboot
```

After a reboot, run `install-portainer.sh`, to install Portainer.io

```
wget -qO- https://raw.githubusercontent.com/pi-hosted/pi-hosted/master/install_portainer.sh | bash
```

## Install Ollama and Docker

```
docker run -d --network=host -v open-webui:/app/backend/data -e OLLAMA_BASE_URL=http://127.0.0.1:11434 --name open-webui --restart always ghcr.io/open-webui/open-webui:main
```

If the installation is successful, the openWebUi chat window can be accessed here.

http://<<rpiname>>.local:8080/

{{% figure src="openwebui.png" %}} openwebui {{% /figure %}}
