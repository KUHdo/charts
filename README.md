# KUHdo Helm Charts

This is the official place for helm charts developed by KUHdo.
####  Add Helm Repo with bitbucket credentials  
You may want to use this way for local development or minikube instances.  
``helm repo add kuhdo https://api.bitbucket.org/2.0/repositories/kuhdo/charts/downloads --username ${BITBUCKET_USER} --password ${BITBUCKET_APP_PASSWORD}``  
You have to establish the connection with your private bitbucket credentials via the bitbucket app password or plain password. 
This is not very usefull for deployments. 

####  Add Helm Repo via pipline
You need to set up an OAuth consumer in bitbucket first. Be carefull with the consumer.  
You set the permissions for the consumer for the whole workspace.  
At the moment there are no possebillities to shrink them to one repository only.  
After that you get a key and a secret.  
  
Throw those two into your repository variables with the names: ``CLIENT_ID``  and ``CLIENT_SECRET``  
Now your able to create an access_key which is actually valid for 2 hours.
This is done via curl:
````yaml 
  # Generate OAuth access token which is 2 hours valid
  - >
    if [[ -z "${CLIENT_ID}" && -z "${CLIENT_SECRET}" ]]; then echo -e "\\e[31m✖ Error $CLIENT_ID or $CLIENT_SECRET environment variable missing\\e[0m"; fi
  - export ACCESS_TOKEN=$( curl -s -X POST -u "$CLIENT_ID:$CLIENT_SECRET" https://bitbucket.org/site/oauth2/access_token -d grant_type=client_credentials -d scopes=repository  | jq --raw-output '.access_token')
````
````yaml
- export CHARTNAME=webapp
- export CHARTVERSION=0.1.1
- >
 curl -O -L -s -H "Authorization: Bearer $ACCESS_TOKEN" \
                https://api.bitbucket.org/2.0/repositories/kuhdo/charts/downloads/$CHARTNAME-$CHARTVERSION.tgz
`````
````yaml
# First install with
#- helm install kuhdo-webapp $CHARTNAME-$CHARTVERSION.tgz --set tags.local=true
- helm upgrade -n kuhdo-local --install kuhdo-webapp $CHARTNAME-$CHARTVERSION.tgz --set tags.local=true --create-namespace
````
---

#### Add new helm charts

If you want to add a new chart feel free to do this under th ``charts/`` directory.  
The bitbucket-pipeline packages the new chart to a .tgz file and pushes the new packed chart in downloads section and references it in the ``index.yaml``

