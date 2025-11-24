+++
date = '2025-11-24T02:07:32+01:00'
draft = false
title = 'How to fine-tune a Model'
summary = "A guide to finetuning a small language model"
authors= [""]
categories= [""]
tags= [""]
unlisted=true
featured_image= "runlora.png"
+++
## Fine tuning with small dataset

### Create the dataset
The format that works best is to have the Q&A in the format below. 
Note this is a `jsonl` format so you don't need to add commas at the end of each line. 

```jsonl
{"text": "Instruction: What does Spivak mean by 'epistemic violence'?\nResponse: Spivak defines epistemic violence as 'the remotely orchestrated, far-flung, and heterogeneous project to constitute the colonial subject as Other.' This violence is 'also the asymetrical obliteration of the trace of that Other in its precarious Subjectivity.' It works through 'ideological and scientific production' and 'the institution of the law' to erase how subaltern subjects could occupy their own histories."}
```

### Install 

```bash
python3 -m venv femdata
source femdata/bin/activate
pip install mlx mlx-lm
```

### Fine Tune with mlx

```bash
mlx_lm.lora \
    --model HuggingFaceTB/SmolLM2-360M-Instruct \
    --train \
    --data data \
    --iters 800 \
    --batch-size 2 \
    --adapter-path ./adapters/smolFem2
```
### Run model with adapters

```bash
mlx_lm.generate --model HuggingFaceTB/SmolLM2-360M-Instruct --adapter-path ./adapters/smolFem2 --prompt "Instruction: What do we learn from carrier bag theory of fiction?\nOutput:" --max-tokens 1000
```

### Fuse the model
```bash
mlx_lm.fuse --model HuggingFaceTB/SmolLM2-360M-Instruct --adapter-path adapters/smolFem2 --save-path ./models/smolFem --de-quantize
```

### Make it an Ollama model

#### Create a Modelfile
Create a new file with the name `Modelfile` (no extension needed) in the `models` folder. 

```bash
nano Modelfile
```

In the file add this line:
```
FROM smolFem
```
> you can edit this in any text editor or IDE

#### Create the Ollama model

Make sure to `deactivate` the virtual env before creating the model 

```bash
cd models  
ollama create smolFem
```

#### Test in Ollama
```bash
ollama run smolFem
```

#### Move to Raspberry Pi

Copy your models folder and the Modelfile to your Raspberry Pi

```bash
scp -r models username@raspberrypi.local:/home/pi/small-data
```

Replace username and raspberry pi with your ssh details

SSH to your Pi

```bash
cd /path/to/modelsfolder
ollama create smolFem
```
