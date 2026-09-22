+++
date = '2026-09-22T13:00:00+02:00'
draft = false
title = 'Zines'
summary = ""
authors= [""]
categories= [""]
tags= [""]
unlisted=true
slug="zines"
featured_image= "image.png"
+++

Sun Shines Bright is also a series of printed zines. Each one has a QR code on the back that brings you here, where you can find what is in it and the links it points at.

The zines are made with [p5.(gen)zine](https://munusshih.github.io/p5.genzine/), so each one is a small program you can print and fold yourself.

<style>
/* Three zines side by side. The text column on this site is 33rem, but images
   are allowed 1040px, so the grid uses that wider measure and the paragraphs
   inside it are released from the narrow column. One column on a phone. */
.zine-grid {
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  gap: 2.5rem;
  max-width: var(--max-img-width);
  margin: calc(2 * var(--pad)) auto 0;
}
.zine-grid figure,
.zine-grid .figure-controls,
.zine-grid .article-img { max-width: 100%; margin: 0; }
.zine-grid p,
.zine-grid ul {
  max-width: 100%;
  width: 100%;
  margin-left: 0;
  margin-right: 0;
}
.zine-grid ul { padding-left: 1.1rem; }
@media only screen and (max-width: 900px) {
  .zine-grid { grid-template-columns: 1fr; gap: 3rem; }
}
</style>

<div class="zine-grid">
<div class="zine">

{{% figure src="vol1-cover.png" %}} Sun Shines Bright Vol.1. Experiments in running solar powered servers for Small Language Models. By computational mama, April 2025. {{% /figure %}}

<p>Building a small solar powered server from scratch, and the questions that come with it. What it takes to self host a language model on renewable power, and why you might want to.</p>
<ul>
<li><a href="https://solar.lowtechmagazine.com/">Low Tech Magazine</a></li>
<li><a href="https://solarprotocol.net/">Solar Protocol</a></li>
<li><a href="https://openwebui.com/">OpenWebUI</a></li>
<li><a href="https://www.ollama.com/">Ollama</a></li>
</ul>
</div>
<div class="zine">

{{% figure src="vol2-cover.png" %}} Sun Shines Bright Vol.2. Fine-tuning a Small Language Model. By computational mama, Sameera Mudgal and lekkerying, September 2026. {{% /figure %}}

<p>Making a dataset by hand and using it to steer a small model with LoRA. On the labour that goes into a dataset, and what fine-tuning can and cannot change.</p>
<ul>
<li><a href="https://solararchive.cmama.xyz/2025/11/howtofinetuneamodel/">How to fine-tune a Model</a></li>
<li><a href="https://www.youtube.com/watch?v=HcTCjy5czWg">DATACRAFT: Fine tuning Small Language Models</a></li>
</ul>
</div>
<div class="zine">

{{% figure src="vol3-cover.png" %}} Sun Shines Bright Vol.3. Building Solarbot: a portable solar powered AI server. By computational mama and lekkerying, September 2026. {{% /figure %}}

<p>Taking the solar server outside. A Raspberry Pi 5 with a foldable panel and a battery, running speech to text, a small language model and text to speech, so you can talk to it in the garden or by the canal.</p>
</div>
</div>
