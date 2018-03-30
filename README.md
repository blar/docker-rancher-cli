# rancher-cli for Docker

Create a new api key in your rancher under "API", "Keys".

## Environment variables

### RANCHER_URL

e.g https://rancher.example.com/v2-beta for account api keys. 

e.g https://rancher.example.com/v2-beta/projects/1a1337 for environment api keys.

### RANCHER_ACCESS_KEY

### RANCHER_SECRET_KEY

### RANCHER_ENVIRONMENT

Environment name or id. Maybe optional if you use an environment api key.

## Gitlab

### Secret variables in CI / CD

Add the variables RANCHER_URL, RANCHER_ACCESS_KEY, RANCHER_SECRET_KEY and
RANCHER_ENVIRONMENT to the secret variables under CI / CD in the group in
Gitlab that correspond to your environment in Rancher.

### .gitlab-ci.yml 

    variables:
        RANCHER_STACK_NAME: $CI_PROJECT_NAME-$CI_ENVIRONMENT_NAME

    staging:
        image: foobox/rancher-cli:latest
        stage: deploy
        environment: staging
        script:
            - rancher up --upgrade --pull --stack $RANCHER_STACK_NAME --file docker-compose.yml --rancher-file rancher-compose.yml 
