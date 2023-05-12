# le-cert-renew
Renewing Let's Encrypt Credentials when unknown/not sure web root path By using Container
for the ACME HTTP-01 challenge.
## How to use
```
$ git clone https://github.com/syneart/le-cert-renew/
$ cd le-cert-renew/
```

### Copy configuration file first
```
$ cp renew_env.config.template renew_env.config
```
### Setting configuration file and save (use vim or others to edit)
```
$ vim renew_env.config
```
### Excute and Enjoy!
You may need to temporarily stop your web service.
```
$ bash ./renew.sh
```
Wait some time, and restart/reload your web service.

## Check TLS/SSL certificate expiration date
You can use
```
$ source renew_env.config; sudo openssl x509 -enddate -noout -in ${LOCAL_LETSENCRYPT_ROOT_PATH}/live/${DOMAIN_NAME}/cert.pem
```

## If you clearly your web root path, use below command directly!
Please change [LOCAL_LETSENCRYPT_ROOT_PATH], [LOCAL_WEB_ROOT_PATH]'s Value by your-self.
```
$ sudo docker run --rm -v [LOCAL_LETSENCRYPT_ROOT_PATH]:/etc/letsencrypt -v [LOCAL_WEB_ROOT_PATH]:/html -ti certbot/certbot renew
```
