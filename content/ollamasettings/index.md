+++
date = '2025-10-06T01:14:07+02:00'
draft = false
title = 'Ollama Settings'
summary = ""
authors= [""]
categories= [""]
tags= [""]
unlisted=true
featured_image= "image.png"
+++

To run Ollama across computers in the same network.

If Ollama is run as a `systemd` service, environment variables should be set using `systemctl`:

Edit the Ollama Service File: Open the Ollama service configuration file with the following command:

```
sudo systemctl edit ollama.service
```

Add the Environment Variable: In the editor, add the following lines under the [Service] section:

```
[Service]

Environment="OLLAMA_HOST=0.0.0.0"
```

Note #1: Sometimes, `0.0.0.0` does not work due to your environment setup. Instead, you can try setting it to your local ip address like `10.0.0.x` or `xxx.local`, etc.

Note #2: You should put this above this line `### Lines below this comment will be discarded`. It should look something like this:

```
#### Editing /etc/systemd/system/ollama.service.d/override.conf
#### Anything between here and the comment below will become the new contents of the file

[Service]
Environment="OLLAMA_HOST=0.0.0.0"

### Lines below this comment will be discarded

### /etc/systemd/system/ollama.service
# [Unit]
# Description=Ollama Service
# After=network-online.target
#
# [Service]
# ExecStart=/usr/local/bin/ollama serve
# User=ollama
# Group=ollama
# Restart=always
# RestartSec=3
# Environment="PATH=/home/kimi/.nvm/versions/node/v20.5.0/bin:/home/kimi/.local/share/pnpm:/usr/local/sbin:/usr/local/bin:/usr/s>
#
# [Install]
# WantedBy=default.target
```

Restart the Service: After editing the file, reload the systemd daemon and restart the Ollama service:

```
sudo systemctl daemon-reload
sudo systemctl restart ollama
```
