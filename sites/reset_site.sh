echo "Stopping Apache..."
sudo apache2ctl graceful-stop
echo "Apache stopped"

echo "Restarting postgresql"
sudo systemctl restart postgresql
echo "Postgresql restarted"

echo "About to create the drupal DB"
#Set-up the postgresql database	
sudo su - postgres -c "psql -f /var/www/drupal/sites/reset_site_schema.sql"
echo "Drupal DB created"

echo "About to start restoring the site"
cd /var/www/drupal/sites/
sudo drush si pinboard  --db-url=pgsql://pinboard_user:pinboard2017@localhost/pinboard_drupal --account-name=admin --account-pass=password --yes forced			
sudo drush cc all
echo "Site restored"

echo "Starting Apache..."
sudo apache2ctl start
echo "Apache started"
