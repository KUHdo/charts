# Changelog webapp helm chart

All notable changes to `webapp` will be documented in this file

## 0.1.5 - 2021-03-11
- Added mcsql chart for database backups

## 0.1.4 - 2021-03-03
- Certificate Resource is outsourced and default values aren't such specific now
- Only one image tag for all containers named `imageTag` and default value is appVersion of Chart.yml

## 0.1.3 - 2021-03-01
- Queue is restarted with the commands: `php artisan horizon:purge && php artisan horizon: terminate && php artisan queue:restart`by helm hook only on when the deployment gets upgraded
- Pull policy is set to `always` for all containers in bundle