# docker-cloudflare-nginx-iptables

This project is designed for using behind cloudflare CDN. For security reason, you should not expose the original ip address to the public.
This project is motivated by the security need.

This project do a bunch of things:

- Register new containers in nginx automatically (docs of this feature please see [nginx-proxy/nginx-proxy](https://github.com/nginx-proxy/nginx-proxy))
- Forward real ip carried by cloudflare requests to the service containers behind
- Allow only cloudflare to connect to 80,443 ports with iptables
- Automatically update the ip set of cloudflare

This is recommended to use with cloudflare Origin certificates. If you want to use letsencrypt to self-sign certificates, I suggest you to combine this with [evertramos/nginx-proxy-automation](https://github.com/evertramos/nginx-proxy-automation)

**ATTENTION: This will block all the http/https traffic not from Cloudflare on the host, use at your own risk**

## Usage

1. git clone this repo: `git clone https://github.com/BobAnkh/docker-cloudflare-nginx-iptables.git`
2. copy `.env.sample` to `.env` and modify the corresponding settings to your preference
3. place your certificates at the right place if you have or want
4. `docker-compose up -d`

## Credits

This work is inspired by and based on 5 awesome work: 

- [evertramos/nginx-proxy-automation](https://github.com/evertramos/nginx-proxy-automation)
- [nginx-proxy/nginx-proxy](https://github.com/nginx-proxy/nginx-proxy)
- [nginx-proxy/docker-gen](https://github.com/nginx-proxy/docker-gen)
- [VirtusAI/docker-cloudflare-firewall](https://github.com/VirtusAI/docker-cloudflare-firewall)
- [colinmollenhour/docker-confd-firewall](https://github.com/colinmollenhour/docker-confd-firewall)
