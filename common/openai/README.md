# OPENAI

## openai --help

usage: openai [-h] [-v] [-b API_BASE] [-k API_KEY] [-p PROXY [PROXY ...]]
              [-o ORGANIZATION] [-t {openai,azure}]
              [--api-version API_VERSION] [--azure-endpoint AZURE_ENDPOINT]
              [--azure-ad-token AZURE_AD_TOKEN] [-V]
              {api,tools,migrate,grit} ...

positional arguments:
  {api,tools,migrate,grit}
    api                 Direct API calls
    tools               Client side tools for convenience

options:
  -h, --help            show this help message and exit
  -v, --verbose         Set verbosity.
  -b API_BASE, --api-base API_BASE
                        What API base url to use.
  -k API_KEY, --api-key API_KEY
                        What API key to use.
  -p PROXY [PROXY ...], --proxy PROXY [PROXY ...]
                        What proxy to use.
  -o ORGANIZATION, --organization ORGANIZATION
                        Which organization to run as (will use your default
                        organization if not specified)
  -t {openai,azure}, --api-type {openai,azure}
                        The backend API to call, must be `openai` or `azure`
  --api-version API_VERSION
                        The Azure API version, e.g.
                        'https://learn.microsoft.com/en-us/azure/ai-
                        services/openai/reference#rest-api-versioning'
  --azure-endpoint AZURE_ENDPOINT
                        The Azure endpoint, e.g.
                        'https://endpoint.openai.azure.com'
  --azure-ad-token AZURE_AD_TOKEN
                        A token from Azure Active Directory,
                        https://www.microsoft.com/en-
                        us/security/business/identity-access/microsoft-entra-
                        id
  -V, --version         show program's version number and exit

---

## openai api --help

usage: openai api [-h]
                  {chat.completions.create,images.generate,images.edit,images.create_variation,audio.transcriptions.create,audio.translations.create,files.create,files.retrieve,files.delete,files.list,models.list,models.retrieve,models.delete,completions.create}
                  ...

positional arguments:
  {chat.completions.create,images.generate,images.edit,images.create_variation,audio.transcriptions.create,audio.translations.create,files.create,files.retrieve,files.delete,files.list,models.list,models.retrieve,models.delete,completions.create}
                        All API subcommands

options:
  -h, --help            show this help message and exit

---

## openai tools --help

usage: openai tools [-h] {fine_tunes.prepare_data} ...

options:
  -h, --help            show this help message and exit

Tools:
  {fine_tunes.prepare_data}
                        Convenience client side tools

---

## openai migrate --help

usage: openai migrate [-h]

options:
  -h, --help  show this help message and exit

---

## openai grit --help

usage: openai grit [-h]

options:
  -h, --help  show this help message and exit

---

