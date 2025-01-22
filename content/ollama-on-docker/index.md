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

```docker run -d -v ollama:/root/.ollama -p 11434:11434 --name ollama ollama/ollama```

If all goes well go to: 

`http://<<rpiname>>.local:11434/`

You should see a simple message "Ollama is running". This ran fine in the terminal, and then I also just straight up [installed Ollama on the server](https://github.com/ollama/ollama/blob/main/docs/linux.md#linux). I don't know if this was a wise choice but I just did it! :)

This meant I have to think about an alternative to the bundled Ollama and OpenWebUI docker thing. So now I'm testing whether I'm able to get all this to run. 

On my to-dos with this experiment are:

- Running tinyllama with RAG, just like my Gooey Copilot - [Measuring Silences](https://computationalmama.xyz/silence-bot)

- Test fine-tuning of Tinyllama to run Measuring Silences (or similar) without RAG (i have never finetuned an LLM and I think this will make for an interesting project). Note: RASPBERRY PI PROBABLY CAN'T HANDLE THE TRAINING OF A LANGUAGE MODEL SO THIS PART OF THE EXPERIMENT WONT BE SOLAR (EVEN IF I DO IT ON MY MACBOOK M1 LOCALLY). 