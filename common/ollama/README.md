# OLLAMA

## ollama --help

Large language model runner

Usage:
  ollama [flags]
  ollama [command]

Available Commands:
  serve       Start ollama
  create      Create a model
  show        Show information for a model
  run         Run a model
  stop        Stop a running model
  pull        Pull a model from a registry
  push        Push a model to a registry
  list        List models
  ps          List running models
  cp          Copy a model
  rm          Remove a model
  help        Help about any command

Flags:
  -h, --help      help for ollama
  -v, --version   Show version information

Use "ollama [command] --help" for more information about a command.

---

## ollama  serve     --help

Start ollama

Usage:
  ollama serve [flags]

Aliases:
  serve, start

Flags:
  -h, --help   help for serve

Environment Variables:
      OLLAMA_DEBUG               Show additional debug information (e.g. OLLAMA_DEBUG=1)
      OLLAMA_HOST                IP Address for the ollama server (default 127.0.0.1:11434)
      OLLAMA_KEEP_ALIVE          The duration that models stay loaded in memory (default "5m")
      OLLAMA_MAX_LOADED_MODELS   Maximum number of loaded models per GPU
      OLLAMA_MAX_QUEUE           Maximum number of queued requests
      OLLAMA_MODELS              The path to the models directory
      OLLAMA_NUM_PARALLEL        Maximum number of parallel requests
      OLLAMA_NOPRUNE             Do not prune model blobs on startup
      OLLAMA_ORIGINS             A comma separated list of allowed origins
      OLLAMA_SCHED_SPREAD        Always schedule model across all GPUs
      OLLAMA_FLASH_ATTENTION     Enabled flash attention
      OLLAMA_KV_CACHE_TYPE       Quantization type for the K/V cache (default: f16)
      OLLAMA_LLM_LIBRARY         Set LLM library to bypass autodetection
      OLLAMA_GPU_OVERHEAD        Reserve a portion of VRAM per GPU (bytes)
      OLLAMA_LOAD_TIMEOUT        How long to allow model loads to stall before giving up (default "5m")

---

## ollama  create    --help

Create a model

Usage:
  ollama create MODEL [flags]

Flags:
  -f, --file string       Name of the Modelfile (default "Modelfile")
  -h, --help              help for create
  -q, --quantize string   Quantize model to this level (e.g. q4_K_M)

Environment Variables:
      OLLAMA_HOST                IP Address for the ollama server (default 127.0.0.1:11434)

---

## ollama  show      --help

Show information for a model

Usage:
  ollama show MODEL [flags]

Flags:
  -h, --help         help for show
      --license      Show license of a model
      --modelfile    Show Modelfile of a model
      --parameters   Show parameters of a model
      --system       Show system message of a model
      --template     Show template of a model
  -v, --verbose      Show detailed model information

Environment Variables:
      OLLAMA_HOST                IP Address for the ollama server (default 127.0.0.1:11434)

---

## ollama  run       --help

Run a model

Usage:
  ollama run MODEL [PROMPT] [flags]

Flags:
      --format string           Response format (e.g. json)
  -h, --help                    help for run
      --hidethinking            Hide thinking output (if provided)
      --insecure                Use an insecure registry
      --keepalive string        Duration to keep a model loaded (e.g. 5m)
      --nowordwrap              Don't wrap words to the next line automatically
      --think string[="true"]   Enable thinking mode: true/false or high/medium/low for supported models
      --verbose                 Show timings for response

Environment Variables:
      OLLAMA_HOST                IP Address for the ollama server (default 127.0.0.1:11434)
      OLLAMA_NOHISTORY           Do not preserve readline history

---

## ollama  stop      --help

Stop a running model

Usage:
  ollama stop MODEL [flags]

Flags:
  -h, --help   help for stop

Environment Variables:
      OLLAMA_HOST                IP Address for the ollama server (default 127.0.0.1:11434)

---

## ollama  pull      --help

Pull a model from a registry

Usage:
  ollama pull MODEL [flags]

Flags:
  -h, --help       help for pull
      --insecure   Use an insecure registry

Environment Variables:
      OLLAMA_HOST                IP Address for the ollama server (default 127.0.0.1:11434)

---

## ollama  push      --help

Push a model to a registry

Usage:
  ollama push MODEL [flags]

Flags:
  -h, --help       help for push
      --insecure   Use an insecure registry

Environment Variables:
      OLLAMA_HOST                IP Address for the ollama server (default 127.0.0.1:11434)

---

## ollama  list      --help

List models

Usage:
  ollama list [flags]

Aliases:
  list, ls

Flags:
  -h, --help   help for list

Environment Variables:
      OLLAMA_HOST                IP Address for the ollama server (default 127.0.0.1:11434)

---

## ollama  ps        --help

List running models

Usage:
  ollama ps [flags]

Flags:
  -h, --help   help for ps

Environment Variables:
      OLLAMA_HOST                IP Address for the ollama server (default 127.0.0.1:11434)

---

## ollama  cp        --help

Copy a model

Usage:
  ollama cp SOURCE DESTINATION [flags]

Flags:
  -h, --help   help for cp

Environment Variables:
      OLLAMA_HOST                IP Address for the ollama server (default 127.0.0.1:11434)

---

## ollama  rm        --help

Remove a model

Usage:
  ollama rm MODEL [MODEL...] [flags]

Flags:
  -h, --help   help for rm

Environment Variables:
      OLLAMA_HOST                IP Address for the ollama server (default 127.0.0.1:11434)

---

## ollama  help      --help

Help provides help for any command in the application.
Simply type ollama help [path to command] for full details.

Usage:
  ollama help [command] [flags]

Flags:
  -h, --help   help for help

---

## ollama list

NAME                                                      ID              SIZE      MODIFIED          
gpt-oss:latest                                            f2b8351c629c    13 GB     About an hour ago    
indo-relevance:latest                                     96f709cf97a8    3.3 GB    26 hours ago         
crisp-im/Qwen3-30B-A3B-Instruct-2507-UD-Q4_K_XL:latest    a1c18d282c03    17 GB     5 days ago           
qwen3:30b-a3b                                             2ee832bc15b5    18 GB     3 months ago         
qwen3:14b                                                 7d7da67570e2    9.3 GB    3 months ago         
okusi-keyphrase-gemma3:12b                                b9966e70fc87    8.1 GB    4 months ago         
whatlang-gemma3:4b                                        d52a7f28f366    3.3 GB    4 months ago         
okusi-keyphrase-gemma3:4b                                 f07263b96a27    3.3 GB    4 months ago         
gemma3:1b                                                 2d27a774bc62    815 MB    4 months ago         
gemma3:12b                                                6fd036cefda5    8.1 GB    4 months ago         
gemma3:4b                                                 c0494fe00251    3.3 GB    4 months ago         
gemma3:27b                                                30ddded7fba6    17 GB     4 months ago         
qwq:latest                                                cc1091b0e276    19 GB     5 months ago         
tomasmcm/undi95-meta-llama-3.1-8b-claude:q5_K_M           284ae9e1633b    5.7 GB    5 months ago         
llama3.1:8b                                               46e0c10c039e    4.9 GB    5 months ago         
bpk-laws:latest                                           b47d3f9f4414    16 GB     5 months ago         
deepseek-r1:14b                                           ea35dfe18182    9.0 GB    5 months ago         
deepseek-r1:32b                                           38056bbcbb2d    19 GB     6 months ago         
deepseek-r1:8b                                            28f8fd6cdc67    4.9 GB    6 months ago         
deepseek-r1:70b                                           0c1615a8ca32    42 GB     6 months ago         
llama3.3:latest                                           a6eb4748fd29    42 GB     7 months ago         
qwen2.5-coder:14b                                         3028237cc8c5    9.0 GB    8 months ago         
nemotron-mini:4b-instruct-fp16                            d0d806e9853c    8.4 GB    9 months ago         
llama3.2:latest                                           a80c4f17acd5    2.0 GB    10 months ago        
llama3.1:8b-instruct-fp16                                 a8f4d8643bb2    16 GB     11 months ago        
llama3.1:latest                                           62757c860e01    4.7 GB    12 months ago        

---

## ollama list |sort |cut -d " " -f1| grep -v NAME

bpk-laws:latest
crisp-im/Qwen3-30B-A3B-Instruct-2507-UD-Q4_K_XL:latest
deepseek-r1:14b
deepseek-r1:32b
deepseek-r1:70b
deepseek-r1:8b
gemma3:12b
gemma3:1b
gemma3:27b
gemma3:4b
gpt-oss:latest
indo-relevance:latest
llama3.1:8b
llama3.1:8b-instruct-fp16
llama3.1:latest
llama3.2:latest
llama3.3:latest
nemotron-mini:4b-instruct-fp16
okusi-keyphrase-gemma3:12b
okusi-keyphrase-gemma3:4b
qwen2.5-coder:14b
qwen3:14b
qwen3:30b-a3b
qwq:latest
tomasmcm/undi95-meta-llama-3.1-8b-claude:q5_K_M
whatlang-gemma3:4b

---

## ollama ps

NAME    ID    SIZE    PROCESSOR    CONTEXT    UNTIL 

---

