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
This project was made in collaboration with [Sameera Mudgal](https://www.linkedin.com/in/sameeramudgal/) and received funding from [DATACRAFT](https://www.hesge.ch/head/en/project/datacraft-custom-datasets-artists-and-designers) project.

You can also follow along with this video tutorial: https://youtu.be/HcTCjy5czWg

### Create the dataset
The format that works best is to have the Q&A in the format below. 
Note this is a `jsonl` format so you don't need to add commas at the end of each line. 

```jsonl
{"text": "Instruction: What does Spivak mean by 'epistemic violence'?\nResponse: Spivak defines epistemic violence as 'the remotely orchestrated, far-flung, and heterogeneous project to constitute the colonial subject as Other.' This violence is 'also the asymetrical obliteration of the trace of that Other in its precarious Subjectivity.' It works through 'ideological and scientific production' and 'the institution of the law' to erase how subaltern subjects could occupy their own histories."}
```

### Install MLX and MLX-LM

MLX is an array framework for machine learning on Apple silicon and MLX-LM is for generating text and fine-tuning large language models on Apple silicon with MLX. 

More about [MLX](https://github.com/ml-explore/mlx) and [MLX-LM](https://github.com/ml-explore/mlx-lm)

```bash
python3 -m venv femdata
source femdata/bin/activate
pip install mlx mlx-lm
```

### Fine Tune with mlx

Choose any model from Hugging Face or the MLX Community, it will auto download to run.
Make sure you are using the path for the data folder correctly. 

```bash
mlx_lm.lora \
    --model HuggingFaceTB/SmolLM2-360M-Instruct \
    --train \
    --data path/to/datafolder \
    --iters 800 \
    --batch-size 2 \
    --adapter-path ./adapters/smolFem2
```
### Run model with adapters

Adapter requires the original model you use for fine tuning and it will run the fine-tune correctly.

```bash
mlx_lm.generate --model HuggingFaceTB/SmolLM2-360M-Instruct --adapter-path ./adapters/smolFem2 --prompt "Instruction: What do we learn from carrier bag theory of fiction?\nOutput:" --max-tokens 1000
```

### Fuse the model

Once you are happy with the adapter's performance you can 'fuse' the model and the adapter to make your own fine-tuned model. 

```bash
mlx_lm.fuse --model HuggingFaceTB/SmolLM2-360M-Instruct --adapter-path adapters/smolFem2 --save-path ./models/smolFem --de-quantize
```

### Make it an Ollama model

This is useful to make the model accesible on the Ollama chat interface or to use in the API in your network. 

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
scp -r models username@raspberrypi.local:/path/to/folder/
```

_Replace username and raspberry pi with your ssh details_

**SSH to your Pi**

```bash
cd /path/to/modelsfolder
ollama create smolFem
```
