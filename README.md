The DigitalOcean (DO) provider is used to interact with the resources supported by DigitalOcean. The provider needs to be configured with the proper credentials before it can be used.

Use the navigation to the left to read about the available resources.

The following arguments are supported:

token - (Required) This is the DO API token. Alternatively, this can also be specified using environment variables ordered by precedence:

```
export DIGITALOCEAN_TOKEN = ""
export DIGITALOCEAN_ACCESS_TOKEN =""

export DO_SPACES_ACCESS_KEY = ""
export DO_SPACES_SECRET_KEY = ""

```