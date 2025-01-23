## Folder structure 
```
content/
|-posts/
|  |-firstpost/
|  |  |-index.md
|  |  |-images/
|  |    |-img.png 
|  │    ├── dithers
|  │    │   ├── img_dithered.png
|  |-secondpost/
|  |  |-index.md
|  |  |-images/
|  |    |-img2.png 
|  │    ├── dithers
|  │    │   ├── img2_dithered.png
|-extrapage/
|  |-index.md
```

### Make a new post 

`hugo new content posts/nameofpost/index.md`

### Make an extra page 

`hugo new content extrapage/index.md`

### Image shortcodes

The design relies on shortcodes for images rather than markdown image tags:

`{{% figure src="yutampo2.png" %}} Una borsa d’acqua calda giapponese detta yutampo, fatta di plastica rigida. Fonte: All About Japan. [https://allabout-japan.com/en/article/6244/](https://allabout-japan.com/en/article/6244/) {{% /figure %}}
`
