+++
date = '2026-05-03T18:47:04+02:00'
draft = false
title = 'Solarbot'
summary = "**Solarbot** is a portable feminist AI server"
authors= [""]
categories= [""]
tags= [""]
unlisted=true
featured_image= "solarbot.png"
+++

An important part of this project, the solar panel couldn't travel with me to the Netherlands. The cost of buying a panel of the same wattage in Netherlands is about 5 times. But I found something very exciting about the dutch urge to drop everything and head out if the _sun shines bright_! Where we live is fairly suburban, our amazing retired neighbours and their zeal for making the most of the sunny days made me reconsider the solar server as a portable artefact. 

The idea now wanted to "touch grass"! This meant that: 
- one could make the AI server portable, 
- move away generic chat/screen based AI interactions 

For now, I've started with a UPS battery and a small screen called Whisplay which includes a speaker and mic. A lot of the code is from the [Whisplay Chatbot](https://github.com/PiSugar/whisplay-ai-chatbot/tree/master/python) repo, with some visual and technical additions. 

{{% figure src="botandpanel.jpg" %}} Setup with Potable Solar Panel, Raspberry Pi 5 with Whisplay {{% /figure %}}
## Why portable? 

Since Sun Shines Bright is hosted on a single board computer, it's size and lower energy usage make it such a great portable idea, and it being stuck inside a utility closet seemed limiting. I think there is nothing that could challenge the idea of a large immovable colossus of a data center than a server that can fit in my hand! :) 

### Hardware

- Raspberry Pi 5 (16 GB)
- PiSugar Whisplay HAT (LCD 240×280, speaker, mic, RGB LED, button)
- PiSugar 3 battery
- Portable Solar Panel (60W)

{{% figure src="solarbot.png" %}} Setup Diagram with Potable Solar Panel, Raspberry Pi 5 with PiSugar 3 battery and Whisplay {{% /figure %}}

## Architecture

**Solarbot** is a portable feminist AI server built to run entirely offline on a Raspberry Pi 5. It lives on a PiSugar Whisplay HAT — a compact board with a 240×280 LCD screen, speaker, microphone, RGB LED, and a button — powered by a PiSugar 3 battery - which is recharged by a generic portable Solar Panel. 

The stack is built with local-first open source models: 
- faster-whisper for speech recognition, 
- Ollama running Qwen 2.5 as the language model, 
- Piper for text-to-speech, and 
- Qdrant with nomic-embed-text embeddings for retrieval-augmented generation. 

{{% figure src="software-architecture.png" %}} Solarbot Architecture {{% /figure %}}

### Code 

https://github.com/computational-mama/solarbot

## What could AI interactions be like for a portable AI server? 

It seems that once the server leaves the closet, the chat window stops making sense. The Whisplay was an interesting and quick exploration as it has a built in button, a small screen and a mic. Can we have a conversation that fits a garden bench or a walk by the canal. What are the other speculations we can think of?

The first fine-tuning experiments didn't give me good results, so I moved to a simple RAG setup. Now the knowledge lives in a folder of files I can read, edit and question.

## Learnings

The use of a portable AI server meant that we needn’t be restricted to text based chat interfaces. We could explore voice, different screen sizes, and other combinations. At [REALML 2026 Johannesburg](https://realml.org/programming/real-ml-workshop-2026-johannesburg-south-africa/), I was advised to have measurable energy data on the solarbot. This is now in testing along with Ying! :)

{{% figure src="datareading1.png" %}} Solarbot Power Draw Reading {{% /figure %}}
{{% figure src="datareading2.png" %}} Solarbot Power Draw Reading {{% /figure %}}






