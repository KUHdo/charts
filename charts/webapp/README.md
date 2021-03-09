## Quickstart  
``helm install kuhdo-app ./ ``  
---

## Develop  
``helm install kuhdo-app ./ --dry-run --debug``  
---
### Run on local cluster

#### Install Traefik via helm
```bash
helm upgrade \
      --install \
      --create-namespace \
      --namespace kube-system \
      --repo https://helm.traefik.io/traefik \
      --version 9.11.0 \
      traefik \
      traefik
```

#### Install KUHdo webapp via helm
```bash
helm upgrade kuhdo-app \
    . \
    --install \
    --namespace kuhdo-app \
    --create-namespace \
    --set tags.local=true \
    --set imageTag=develop \
    --set ingress.hosts.web.host=dev.kuhdo.local \
    --set ingress.hosts.websocket.host=ws.dev.kuhdo.local \
    --set dotenv.APP_URL="http://dev.kuhdo.local" \
    --set dotenv.SESSION_DOMAIN=".dev.kuhdo.local" \
    --set certificate.enabled="false" \
    --set imageCredentials.username= \
    --set imageCredentials.password= \
    --set secrets.webapp.EEX_SFTP_USERNAME= \
    --set secrets.webapp.EEX_SFTP_PASSWORD= \
    --set secrets.webapp.APP_KEY=
```
**Don't forget to fill the empty keys!**  
Go to http://dev.kuhdo.local

## Scale and update

``helm upgrade --set replicaCount=3 kuhdo-app ./``  
---

## Configuration 
| Values.yaml | .env     |
| ------------|----------|
| dotenv.APP_DEBUG  | APP_DEBUG |
| dotenv.APP_ENV  | APP_ENV |
| dotenv.APP_LOG_LEVEL  | APP_LOG_LEVEL |
| dotenv.APP_LOG_CHANNEL  | APP_LOG_CHANNEL |
| dotenv.APP_NAME  | APP_NAME |
| dotenv.APP_URL  | APP_URL |
| dotenv.BROADCAST_DRIVER  | BROADCAST_DRIVER |
| dotenv.CACHE_DRIVER  | CACHE_DRIVER |
| dotenv.QUEUE_DRIVER  | QUEUE_DRIVER |
| dotenv.SESSION_DRIVER  | SESSION_DRIVER |
| dotenv.SESSION_DOMAIN  | SESSION_DOMAIN |
| dotenv.SESSION_CONNECTION  | SESSION_CONNECTION |
| dotenv.DB_CONNECTION  | DB_CONNECTION |
| dotenv.DB_HOST  | DB_HOST |
| dotenv.DB_PORT  | DB_PORT |
| dotenv.REDIS_HOST  | REDIS_HOST |
| dotenv.REDIS_PORT  | REDIS_PORT |
| dotenv.REDIS_CLIENT  | REDIS_CLIENT |
| dotenv.MAIL_MAILER  | MAIL_MAILER |
| dotenv.MAIL_HOST  | MAIL_HOST |
| dotenv.MAIL_NAME  | MAIL_NAME |
| dotenv.MAIL_PORT  | MAIL_PORT |
| dotenv.MAIL_USERNAME  | MAIL_USERNAME |
| dotenv.MAIL_FROM_ADDRESS  | MAIL_FROM_ADDRESS |
| dotenv.MAIL_ENCRYPTION  | MAIL_ENCRYPTION |
| dotenv.MAILGUN_DOMAIN  | MAILGUN_DOMAIN |
| dotenv.MAILGUN_ENDPOINT  | MAILGUN_ENDPOINT |
| dotenv.TELESCOPE_REQUEST_WATCHER  | TELESCOPE_REQUEST_WATCHER |
| dotenv.TELESCOPE_ENABLED  | TELESCOPE_ENABLED |
| dotenv.EEX_SFTP_HOST  | EEX_SFTP_HOST |
| dotenv.TRUST_PROXY  | TRUST_PROXY |
| dotenv.PUSHER_ENDPOINT_SCHEME  | PUSHER_ENDPOINT_SCHEME |
| dotenv.PUSHER_APP_ID  | PUSHER_APP_ID |
| dotenv.PUSHER_APP_KEY  | PUSHER_APP_KEY |
| dotenv.PUSHER_FORCE_TLS  | PUSHER_FORCE_TLS |
| dotenv.ECHO_ENCRYPTED  | ECHO_ENCRYPTED |
| secrets.webapp.APP_KEY | APP_KEY |
| secrets.webapp.EEX_SFTP_PASSWORD | EEX_SFTP_PASSWORD |
| secrets.webapp.EEX_SFTP_REMOTE_PATH | EEX_SFTP_REMOTE_PATH |
| secrets.webapp.EEX_SFTP_USERNAME | EEX_SFTP_USERNAME |
| secrets.webapp.LOG_SLACK_WEBHOOK_URL | LOG_SLACK_WEBHOOK_URL |
| secrets.webapp.MAILGUN_SECRET | MAILGUN_SECRET |
| secrets.webapp.MAIL_PASSWORD | MAIL_PASSWORD |
| secrets.webapp.SLACK_WEBHOOK_URL | SLACK_WEBHOOK_URL |
| secrets.webapp.PUSHER_APP_SECRET | PUSHER_APP_SECRET |