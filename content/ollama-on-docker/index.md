+++
date = '2025-01-21T12:42:25+05:30'
draft = false
title = 'Ollama on Docker'
summary = ""
lang= "en"
authors= [""]
categories= [""]
tags= [""]
unlisted=true
featured_image= "image.png"
+++

https://ollama.com/blog/ollama-is-now-available-as-an-official-docker-image

docker run -d -v ollama:/root/.ollama -p 11434:11434 --name ollama ollama/ollama

If all goes well go to: 

http://<<rpiname>>.local:11434/

you should see a simple message "Ollama is running"

