+++
date = '2025-01-14T13:35:23+05:30'
draft = false
title = 'Self-hosting and perils beyond'
summary = "A longer post about Self hosting and why I'm doing all this!"
authors= ["Cm" ]
categories= [""]
tags= [""]
unlisted=true
featured_image= "tinyllama.jpeg"
+++

Last September, my colleague [Kaustubh gave a wonderful talk](https://www.youtube.com/watch?v=hQtYPGbl9gE) about how he is self-hosting from an old laptop. He spoke very excitedly about his intentions with it, and how he achieved everything. Kaustabh technical know-how is exceptional, and he communicated the idea very simply.

It finally gave me a sense of what people say when they use the term “server”. I think it never struck me that it quite literally means “to serve”. So the server, _serves_ websites or other computatational things!

After the talk, I was super excited and wondering what it might mean to host my own server, and if I could potentially do it with a rapsberry pi 4 that is lying around!

## Solar dreams
In Oct/Nov 2024, I sat in on a info session from [Rhizome.org](https://rhizome.org/), where a speaker explained a long standing project called **[Solar Protocol](https://solarprotocol.net/)**. This also hosts simple websites on a raspberry pi - the amazing part is that they use Solar power to keep everything running!

My combined excitement of selfhosting, raspberry pis and solar power source has kicked in hard in 2025 and this post is just a long form of things I did.

## Yunohost and ISP woes!

After digging through basic resources like r/selfhosted and other lists. I found the documentation for Yunohost (pronounced Y-U-No-Host), very simple and easy to try. There was no code required for the setup. While I can code some and SSH into raspberry pis, I find that if the setup is easy, its a format/tool that I can share with others who aren’t technologists. To me arming with understanding technology makers is always as exhilirating learning something new myself.

Sure enough, this a simple image flash, YUNOHOST was installed and the admin panel was running as a browser interface!

The diagnostics tool told me that everything was looking fine aside from my port forwarding.

After some more youtube-ing, and weird bumps on the way, I was able to get all the port forwarding details in place. But nothing worked!

I called my ISP team, and they assured me it wasn’t on their end and all the ports were open! So I struggled a bit more, searching through the internet and youtube!

In the searches, two things kept coming back:
1. A playlist by Pi-hosted which uses RaspiOS+portainer.io (a docker something) and,
2. “Tunnels” instead of port forwarding

I kept resisting the solutions trying my best to get Yunohost up and running. Finally the ISP connected me to their senior networking engineer, and he explained that I have to buy the public static IP. This service is 2.5x the cost in Udaipur (perhaps as the ISP is local this request is not as common).

After a quick chat with Kaustubh about this, I decided to try a tunnel with Cloudflare, again I could’nt get this to work with Yunohost.

Apparently, Yunohost once installed and running with portforwarding will split the use of the localhost and the dedicated domain in two parts:
- the localhost will serve only as admin interface
- the domain will serve the frontend/dashboard for your services

## Back to drawing board

After all the Yunohost tears were wiped away. The steps were pretty clear:

1. Install raspiOS headless (this was easy as I have tried this several times)
2. Test the services I want to host like the LLM, Jellyfin etc.
3. Host via docker to things are running neatly in containers (I’m still a noob on this stuff - but had to figure it out as best I could)
4. Test the services on docker and decide what happens next
5. [Take the plunge into solar powering this shindig!]({{< ref "/posts/solar-realism" >}})
6. See where this goes! :)

For this post, I will focus on steps 2, 3 and 4 (Step 5 is still a dream)!

> NOTE: All this was done entirely on SSH.

## Bro, can you even LLM?

Hosting an LLM on the Raspberry Pi was my main goal. After building Mother Machines v2 last year, I’ve been thinking a lot of local computing. There is something very empowering to discover that your computer (‘daily driver’) can actually generate AI images. Imagine if a tiny computer like a raspberry pi can run a chatbot!

The steps for this were:
1. Run ollama with a simple and smolLM. I used Tinyllama! Choice of the model was PURELY based on the fact that it was called “Tiny”llama.
2. Connect to [openwebUI’s chat interface](https://github.com/open-webui/open-webui)
3. Test in local network
4. Tunnel via Cloudflare!

All these steps worked quite well, but obviously they stop when close the terminal (I’m a forever noob with terminal things)

{{% figure src="tinyllama.jpeg" %}} tinyllama {{% /figure %}}

### Trying Docker
I have never used docker but it seemed to be an easy and well documented format for servers and in particular for Raspberry Pi as a server. You can find more about Raspberry Pi hosting here: https://pi-hosted.com/, by the amazing youtuber [Nova spirit tech](https://www.youtube.com/channel/UCrjKdwxaQMSV_NDywgKXVmw).

You can follow the instructions available on their website/youtube playlist!

Once I tested simpler Docker containers like Jellyfin, etc. I was interested in running Ollama+OpenwebUI as a docker container. There are several tutorials from this but I think the best solution to this was the most obvious one - [using OpenwebUI's README!](https://github.com/open-webui/open-webui?tab=readme-ov-file#installing-open-webui-with-bundled-ollama-support) (credit to [sud](https://x.com/theonesud) who shared this link with me!)

This was very exciting - however I had no active cooling on my raspberry pi 4, and it was overheating the board (could smell some plastic burning!).

I'll write more about the solar connection in the next [post]({{< ref "/posts/solar-realism" >}}).
