+++
date = '2026-11-16T09:00:00+01:00'
draft = false
title = 'A tiny model on an ESP32'
summary = "The same 10 questions asked to the solarbot on a Raspberry Pi 5 and to a small language model running on an ESP32 microcontroller. What it costs in time and energy, and what the answers look like."
authors= [""]
categories= [""]
tags= [""]
unlisted=true
slug="esp32-comparison"
+++

<span class="esp32-page"></span>
<style>
/* This page only (the marker above switches it on): smaller text, and a title that lines up with the text column.
   The site's other pages keep their own sizes. */
article:has(.esp32-page) { --max-content-width: 42rem; }
article:has(.esp32-page) .entry-header {
  max-width: var(--max-content-width);
  width: var(--content-width);
}
article:has(.esp32-page) .entry-title { font-size: 1.8rem; line-height: 1.15; text-indent: 0; }
article:has(.esp32-page) .entry-content { font-size: 0.8rem; }
article:has(.esp32-page) .entry-content h2 { font-size: 1.3rem; text-indent: 0; margin-top: 2.2rem; }
article:has(.esp32-page) .entry-content th,
article:has(.esp32-page) .entry-content td { padding: 6px 8px; }
article:has(.esp32-page) .entry-content th:first-child,
article:has(.esp32-page) .entry-content td:first-child { padding-left: 0; }
@media only screen and (max-width: 700px) {
  article:has(.esp32-page) .entry-content table { display: block; overflow-x: auto; }
}
</style>

What happens if the solarbot's language model runs on a microcontroller instead of a Raspberry Pi? We asked the same 10 questions to both and measured the time and the energy.

On these 10 questions the ESP32 used about 3.9 times the energy of the Pi (7.8 Wh against 2.0 Wh) and took about 19 times as long (7.8 hours against 25 minutes). It draws very little power, about 1 W, but it is slow, and its answers fall apart on anything it has not seen before.

## The two setups

| | ESP32-S3 board | Raspberry Pi 5 (solarbot) |
| --- | --- | --- |
| Model | SmolFem-360M, read from an SD card | qwen2.5:0.5b |
| Energy meter | INA219 between the 5 V supply and the board | the Pi's power data on the [dashboard](https://solarbot.cmama.xyz) |
| Answer length | stops at 30 words | free length |
| Questions | typed from a list on the SD card | asked by voice on 5 November |
| Run | 13 to 14 November, 10 questions, 7.8 hours | 5 November, 10 questions |

The ESP32 has too little memory to hold the model, so it reads the whole model (224 MB) from an SD card once for every word it writes. That is why it is slow: about 100 seconds per word, unless the board guesses a few words ahead correctly.

The questions were about Fei-Fei Li, Le Guin's carrier bag theory of fiction, Spivak, Vandana Shiva and Audre Lorde.

## Time and energy per question

| Question | ESP32 time (min) | ESP32 energy (mWh) | Pi time (min) | Pi energy (mWh) |
| --- | --- | --- | --- | --- |
| Who is Fei-Fei Li? | 5.5 | 93 | 1.7 | 125 |
| Le Guin's carrier bag theory | 53.8 | 887 | 2.9 | 229 |
| Spivak, epistemic violence | 14.8 | 248 | 2.8 | 231 |
| Carrier bag, in one sentence | 53.4 | 894 | 0.4 | 26 |
| Vandana Shiva, monocultures of the mind | 61.6 | 1040 | 2.4 | 192 |
| Vandana Shiva, seeds and AI | 60.1 | 1008 | 2.7 | 214 |
| Audre Lorde, the master's tools | 56.2 | 940 | 2.2 | 174 |
| Audre Lorde, the erotic and technology | 58.3 | 973 | 4.2 | 354 |
| Who is Spivak? | 55.1 | 908 | 3.2 | 268 |
| Who is Audre Lorde? | 49.4 | 823 | 2.4 | 201 |
| **Total** | **468** | **7815** | **24.8** | **2014** |

The ESP32 needs about an hour for any question that is not in its training data, whatever the question. Its energy follows from the time, because it draws about 1 W all the time. The Pi answers in minutes but draws more while it does: about 4.9 W on average, and that includes its idle draw.

## What the answers look like

Neither model answers reliably, but they fail in different ways. The ESP32 model sounds like the source and invents it. The Pi model sounds confident and invents facts.

- **Who is Fei-Fei Li?** The ESP32 is right: Chinese-American computer scientist, AI, computer vision. The Pi starts right and then calls her the CEO of a ride-hailing company.
- **Spivak and epistemic violence.** The ESP32 is close to the real idea, with a made-up quote. The Pi gives a reasonable general definition.
- **The carrier bag in one sentence.** The ESP32 reads it as people keeping their car in a bag. The Pi writes one sentence, but about location and value, not the theory.
- **Vandana Shiva and seeds and AI.** The ESP32 never reaches AI. The Pi turns it into sustainable architecture.
- **Audre Lorde.** The ESP32 drifts into Spivak's epistemic violence, and for "Who is Audre Lorde?" it writes "Audre Debelle". The Pi calls her a novelist.
- **Who is Spivak?** The ESP32 falls apart into "a map of a map of a map". The Pi calls her a Russian-American philosopher.

The ESP32 model is right where its small training set covers the topic (Fei-Fei Li, partly Spivak) and breaks down on anything outside it. Its answers stop at 30 words, in the middle of a sentence. The Pi's answers are complete and fluent, and most of them are wrong on the facts. The Pi heard its questions by voice and misheard several names ("Audra Lord", "Spivic"), which hurts its answers.

All the answers and the numbers side by side are on the [solarbot dashboard](https://solarbot.cmama.xyz): open the Static tab and the section "Compare with the ESP32 board". It is only online while the solarbot is switched on.

## The board restarted a lot

During the unattended run the board restarted 16 times: 13 times because a software watchdog timer went off, and 3 times because the supply voltage dipped. After each restart it carried on at the right question, because it keeps its place on the SD card, so the whole list still finished.

## Caveats

- This is not a like-for-like test. The ESP32 stops at 30 words, the Pi writes free length, the models differ, and the two energy meters measure different things. Compare the pattern, not single numbers.
- The Pi's idle draw (about 1.9 W) is included in its totals. The ESP32's idle draw was not measured again for the current wiring.
- The Pi heard the questions by voice and the ESP32 got the exact text.
- An earlier run on the ESP32 with answers up to 60 words finished 7 of the 10 questions in 10.4 hours and used 10.25 Wh.
