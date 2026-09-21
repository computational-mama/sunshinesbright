+++
date = '2026-05-03T18:47:04+02:00'
draft = true
title = 'Solarbot'
summary = ""
authors= [""]
categories= [""]
tags= [""]
unlisted=true
featured_image= "image.png"
+++

An important part of this project, the solar panel couldn't travel with me to the Netherlands. The cost of buying a panel of the same wattage in Netherlands is about 5 times. But I found something very exciting about the dutch urge to drop everything and head out if the _sun shines bright_! Where we live is fairly suburban, our amazing retired neighbours and their zeal for making the most of the sunny days made me reconsider the solar server as a portable artefact. 

The idea now wanted to "touch grass"! This meant that: 
- one could make the AI server portable, 
- move away generic chat/screen based AI interactions 

For now, I've started with a UPS battery and a small screen called Whisplay which includes a speaker and mic. A lot of the code is from the [Whisplay Chatbot](https://github.com/PiSugar/whisplay-ai-chatbot/tree/master/python) repo, with some visual and technical additions. 

## Why portable? 

Since Sun Shines Bright is hosted on a single board computer, it's size and lower energy usage make it such a great portable idea, and it being stuck inside a utility closet seemed limiting. I think there is nothing that could challenge the idea of a large immovable colossus of a data center than a server that can fit in my hand! :) 

## What could AI interactions be like? 

It seems 


--- 

**Solarbot** is a portable feminist AI entity built to run entirely offline on a Raspberry Pi 5. It lives on a PiSugar Whisplay HAT — a compact board with a 240×280 LCD screen, speaker, microphone, RGB LED, and a button — powered by a PiSugar 3 battery - which is recharged by a generic portable Solar Panel. 

The stack is built with local-first open source models: 
- faster-whisper for speech recognition, 
- Ollama running Qwen 2.5 as the language model, 
- Piper for text-to-speech, and 
- Qdrant with nomic-embed-text embeddings for retrieval-augmented generation. 

~~The bot's personality and knowledge are fully configurable — a system prompt shapes how it speaks, and a local knowledge base lets it draw on any documents you feed it. The intention is a small, private, opinionated assistant grounded in a specific body of knowledge rather than a generic chat interface.~~

--- 


## Process 

### Hardware

#### Connections

### Code 





