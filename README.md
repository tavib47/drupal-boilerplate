# Drupal 11 Boilerplate

A comprehensive project template for Drupal 11 development with pre-configured modules and development tools.

## Quick Start

### 1. Create new project from template
```bash
composer create-project tavib47/drupal-boilerplate:^11 my-project-name --ignore-platform-reqs --no-interaction
cd my-project-name
```

### 2. Edit project details

Edit the project name, description and other details in the following files:
* composer.json
* example.robo.yml
* .ddev/config.yaml
* drush/example.drush.yml
* sites/default/settings.ddev.local.php
* README.md (also delete the Drupal 11 Boilerplate title and Quick Start section)

### 3. Configure DDEV
```bash
ddev config --project-name=my-project-name --project-type=drupal11 --docroot=web
```

### 4. Install Drupal
```bash
ddev start
ddev drush site:install pixel_standard --site-name="My Project Name" --account-name=office@example.com --account-mail=office@example.com --site-mail=office@example.com --account-pass=password
```

### 5. Export configuration
```bash
ddev drush cex -y
```

### 6. Initialize git repository
```bash
git init
git add .
git commit -m "Initial commit"
```

# My Project Name

## I. Prerequisites

* [mkcert](https://github.com/FiloSottile/mkcert?tab=readme-ov-file#mkcert) (run `mkcert -install`)
* DDEV 1.22.0+ (https://ddev.com/get-started)

If you get the `Could not connect to a docker provider. Please start or install a docker provider.` error you need to add your user to `docker` group:

```bash
sudo usermod -aG docker $USER
newgrp docker
```

## II. Project setup

* Clone the repository
* Copy `example.robo.yml` to `robo.yml` and customize `username`, `password` and `admin_username`
* Copy `.env.example` to `.env`
* Copy `drush/example.drush.yml` to `drush/drush.yml`

## III. Installation

### 1. First time installation
```bash
ddev drush site-install --existing-config --site-name="My Project Name" --account-name=office@example.com --account-mail=office@example.com --site-mail=office@example.com --account-pass=password
```

### 2. Retrieving the database and files from production or staging
```bash
./scripts/install.sh
```

## IV. Development

* Run `ddev start` to start the project without reinstalling the database
* Run `ddev stop` to stop the project
* Run `ddev launch` to launch the application in the browser or access https://cardionline.ddev.site:14443
* Running drush commands: `ddev drush command` (e.g. `ddev drush config:export`)
* Running custom apps within vendor: `ddev exec ./vendor/bin/app command` (e.g. `ddev exec ./vendor/bin/robo site:update`)

### Other scripts

* `./scripts/update.sh`: Reinstalls all modules, libraries and updates the Drupal instance.
* `./scripts/code-qa.sh`: Runs PHPCS and PHPCBF on custom modules and themes.
* `./scripts/start.sh`: Starts the DDEV containers and launches the application in the browser.

### Theme development

Node Version Manager and Node are already installed in the DDEV's web container.

Start a shell session in the web container (`ddev ssh`) and run the following commands:

* Go to theme directory: `cd web/themes/custom/theme_name`
* Install node version: `nvm install`
* Change node version: `nvm use`
* Run the watcher or the build command:
    * `npm run watch`
    * `npm run build`

### Composer

DDEV provides a built-in command to simplify use of PHP’s dependency manager, Composer, without requiring it to be installed on the host machine.

* `ddev composer help` runs Composer’s help command to learn more about what’s available.

### Email Capture and Review (MailHog)

After your project is started, access the MailHog web interface at http://cardionline.ddev.site:18025, or run `ddev launch -m` to launch it in your default browser.

### Using Development Tools on the Host Machine

Tools that interact with files and require no database connection, such as Git or Composer, can be run from the host machine against the codebase for a DDEV project with no additional configuration necessary.

### Xdebug

* Configure PHPStorm debug: https://ddev.readthedocs.io/en/stable/users/debugging-profiling/step-debugging/#phpstorm-rundebug-configuration-debugging
* Run `ddev xdebug on` to enable Xdebug
* Run `ddev xdebug off` to disable Xdebug

If you want to use Xdebug with a Drush command:

* Create a server in PHPStorm (Project settings->Servers) and name it `cardionline.ro.ddev.site`
* In the PHPStorm server configuration, map your host project directory to /var/www/html
* Run the drush command inside the container (`ddev ssh`): `./vendor/bin/drush command`
