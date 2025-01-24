+++
date = '2025-01-21T12:42:25+05:30'
draft = false
title = 'Ollama on Docker'
summary = "Running Language Models on Rapsberry Pi 4"
lang= "en"
authors= [""]
categories= [""]
tags= [""]
unlisted=true
featured_image= "ollama-docker.jpg"
+++

I started out by assuming that I would need to run ollama on docker too. Which was neatly described here: 
https://ollama.com/blog/ollama-is-now-available-as-an-official-docker-image

```docker run -d -v ollama:/root/.ollama -p 11434:11434 --name ollama ollama/ollama```

If all goes well go to: 

`http://<<rpiname>>.local:11434/`

You should see a simple message "Ollama is running". This ran fine in the terminal, and then I also just straight up [installed Ollama on the server](https://github.com/ollama/ollama/blob/main/docs/linux.md#linux). I don't know if this was a wise choice but I just did it! :) The linux install documentation was very simple, and I think running any LLM applications from Ollama directly made sense to me. Especially if I want to try out some non-chat related projects like I have with [Archive of Lost Mothers](https://archiveoflostmothers.in/). 

This meant I have to think about an alternative to the bundled Ollama and OpenWebUI docker thing.  

## Yay! 

Eventually I found that I was able to run it, with adding the `--network=host` flag, more [here about it](https://github.com/open-webui/open-webui?tab=readme-ov-file#open-webui-server-connection-error). 

The code I ran:

`
docker run -d --network=host -v open-webui:/app/backend/data -e OLLAMA_BASE_URL=http://127.0.0.1:11434 --name open-webui --restart always ghcr.io/open-webui/open-webui:main
`

This worked fine and I was able to get the elegant OpenWebUI running on https://solarchat.cmama.xyz (this link won't work without a login provided by me - I don't want you to burn up my RPI!) Ping me if you want to test it. Ofcourse the computation for the webUI, and general limitation of the compute power means that the responses are slow.

## Next Steps

On my to-dos with this experiment are:

- Running tinyllama with RAG, just like my Gooey Copilot - [Measuring Silences](https://computationalmama.xyz/silence-bot)

- Test fine-tuning of Tinyllama to run Measuring Silences (or similar) without RAG (i have never finetuned an LLM and I think this will make for an interesting project)[^1]. 
- After testing OpenWebUI, I realised that I'm spending a lot of time trying to make the model and even this blog light and efficient to use. So I'm looking for or considering building a super barebones chat that won't waste resources on the UI, yet not look gross! 
  
[^1]: RASPBERRY PI probably can't handle the training a langauge model, so this part of the experiment won't be solar! 