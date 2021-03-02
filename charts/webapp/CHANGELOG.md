# Changelog webapp helm chart

All notable changes to `webapp` will be documented in this file

## 1.3.1 - 2021-03-01
- Queue is restarted with the commands: `php artisan horizon:purge && php artisan horizon: terminate && php artisan queue:restart`by helm hook only on when the deployment gets upgraded
- Pull policy is set to `always` for all containers in bundle