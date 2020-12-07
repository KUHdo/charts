## Quickstart  
``helm install kuhdo-app ./ ``  
---

## Develop  
``helm install kuhdo-app ./ --dry-run --debug``  
---

## Scale and update

``helm upgrade --set replicaCount=3 kuhdo-app ./``  
---

## Configuration 
| Values.yaml | .env     | default value |
| ------------|----------|-----------|
| dotenv.APP_DEBUG  | APP_DEBUG | default value | 
| dotenv.APP_ENV  | APP_ENV | default value | 
| dotenv.APP_LOG_LEVEL  | APP_LOG_LEVEL | default value | 
| dotenv.APP_LOG_CHANNEL  | APP_LOG_CHANNEL | default value | 
| dotenv.APP_NAME  | APP_NAME | default value | 
| dotenv.APP_URL  | APP_URL | default value | 
| dotenv.BROADCAST_DRIVER  | BROADCAST_DRIVER | default value | 
| dotenv.CACHE_DRIVER  | CACHE_DRIVER | default value | 
| dotenv.QUEUE_DRIVER  | QUEUE_DRIVER | default value | 
| dotenv.SESSION_DRIVER  | SESSION_DRIVER | default value | 
| dotenv.SESSION_DOMAIN  | SESSION_DOMAIN | default value | 
| dotenv.SESSION_CONNECTION  | SESSION_CONNECTION | default value | 
| dotenv.DB_CONNECTION  | DB_CONNECTION | default value | 
| dotenv.DB_HOST  | DB_HOST | default value | 
| dotenv.DB_PORT  | DB_PORT | default value | 
| dotenv.REDIS_HOST  | REDIS_HOST | default value | 
| dotenv.REDIS_PORT  | REDIS_PORT | default value | 
| dotenv.REDIS_CLIENT  | REDIS_CLIENT | default value | 
| dotenv.MAIL_MAILER  | MAIL_MAILER | default value | 
| dotenv.MAIL_HOST  | MAIL_HOST | default value | 
| dotenv.MAIL_NAME  | MAIL_NAME | default value | 
| dotenv.MAIL_PORT  | MAIL_PORT | default value | 
| dotenv.MAIL_USERNAME  | MAIL_USERNAME | default value | 
| dotenv.MAIL_FROM_ADDRESS  | MAIL_FROM_ADDRESS | default value | 
| dotenv.MAIL_ENCRYPTION  | MAIL_ENCRYPTION | default value | 
| dotenv.MAILGUN_DOMAIN  | MAILGUN_DOMAIN | default value | 
| dotenv.MAILGUN_ENDPOINT  | MAILGUN_ENDPOINT | default value | 
| dotenv.TELESCOPE_REQUEST_WATCHER  | TELESCOPE_REQUEST_WATCHER | default value | 
| dotenv.TELESCOPE_ENABLED  | TELESCOPE_ENABLED | default value | 
| dotenv.EEX_SFTP_HOST  | EEX_SFTP_HOST | default value | 
| dotenv.MIX_VUE_APP_I18N_LOCALE  | MIX_VUE_APP_I18N_LOCALE | default value | 
| dotenv.MIX_VUE_APP_I18N_FALLBACK_LOCALE  | MIX_VUE_APP_I18N_FALLBACK_LOCALE | default value | 
| dotenv.TRUST_PROXY  | TRUST_PROXY | default value | 
| dotenv.PUSHER_ENDPOINT_SCHEME  | PUSHER_ENDPOINT_SCHEME | default value | 
| dotenv.PUSHER_APP_ID  | PUSHER_APP_ID | default value | 
| dotenv.PUSHER_APP_KEY  | PUSHER_APP_KEY | default value | 
| dotenv.PUSHER_FORCE_TLS  | PUSHER_FORCE_TLS | default value | 
| dotenv.ECHO_ENCRYPTED  | ECHO_ENCRYPTED | default value | 
| secrets.webapp.APP_KEY | APP_KEY | default value |
| secrets.webapp.EEX_SFTP_PASSWORD | EEX_SFTP_PASSWORD | default value |
| secrets.webapp.EEX_SFTP_REMOTE_PATH | EEX_SFTP_REMOTE_PATH | default value |
| secrets.webapp.EEX_SFTP_USERNAME | EEX_SFTP_USERNAME | default value |
| secrets.webapp.LOG_SLACK_WEBHOOK_URL | LOG_SLACK_WEBHOOK_URL | default value |
| secrets.webapp.MAILGUN_SECRET | MAILGUN_SECRET | default value |
| secrets.webapp.MAIL_PASSWORD | MAIL_PASSWORD | default value |
| secrets.webapp.MIX_STRIPE_KEY | MIX_STRIPE_KEY | default value |
| secrets.webapp.MIX_STRIPE_SECRET | MIX_STRIPE_SECRET | default value |
| secrets.webapp.SLACK_WEBHOOK_URL | SLACK_WEBHOOK_URL | default value |
| secrets.webapp.STRIPE_KEY | STRIPE_KEY | default value |
| secrets.webapp.STRIPE_SECRET | STRIPE_SECRET | default value |
| secrets.webapp.STRIPE_TAX_RATE | STRIPE_TAX_RATE | default value |
| secrets.webapp.STRIPE_USER_PLAN | STRIPE_USER_PLAN | default value |
| secrets.webapp.PUSHER_APP_SECRET | PUSHER_APP_SECRET | default value |