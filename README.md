# le-cert-renew
Renewing Let's Encrypt Credentials by using Container

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
