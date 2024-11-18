# How to use this boilerplate

1. Create a project
```
composer create-project tavib47/drupal-boilerplate [project-name] --ignore-platform-reqs --no-interaction
```

2. Update project name in `.ddev/config.yaml`
3. Customize `example.robo.yml`
4. Update `README.md`
5. Install Drupal
```
ddev start
ddev drush site:install pixel_standard --site-name="[project-name]" --account-name=office@example.com --account-mail=office@example.com --site-mail=office@example.com --account-pass=password
```
6. Export configuration
```
ddev drush cex -y
```
