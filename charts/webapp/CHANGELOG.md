# Changelog webapp helm chart

All notable changes to `webapp` will be documented in this file

## 2.0.1 - 2021-03-01
- Queue is restarted with the commands: `php artisan horizon:purge && php artisan horizon: terminate && php artisan queue:restartby helm hook only on when the deployment gets upgraded
- Queue worker pod preStop lifecyle kills itself hopefully graceful with `php artisan horizon:purge`
