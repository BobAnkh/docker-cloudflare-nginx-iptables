# docker-cloudflare-nginx-iptables

Do a bunch of things:

- Register new container in nginx automatically(docs see [nginx-proxy/nginx-proxy](https://github.com/nginx-proxy/nginx-proxy))
- Forward real ip carried by cloudflare requests to the service containers behind
- Allow only cloudflare to connect to 80,443 ports with iptables
- Automatically update the ip set of cloudflare

This is used with cloudflare Origin certificates. If you want to use letsencrypt to self-sign certificates, I suggest you to combine this with [evertramos/nginx-proxy-automation](https://github.com/evertramos/nginx-proxy-automation)

## Usage


## Credits

This work is inspired by and based on 5 awesome work: [evertramos/nginx-proxy-automation](https://github.com/evertramos/nginx-proxy-automation), [nginx-proxy/nginx-proxy](https://github.com/nginx-proxy/nginx-proxy), [nginx-proxy/docker-gen](https://github.com/nginx-proxy/docker-gen), [VirtusAI/docker-cloudflare-firewall](https://github.com/VirtusAI/docker-cloudflare-firewall) and [colinmollenhour/docker-confd-firewall](https://github.com/colinmollenhour/docker-confd-firewall)
