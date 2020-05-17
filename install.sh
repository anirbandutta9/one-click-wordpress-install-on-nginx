#!/bin/sh

echo "Enter domain name : "
read name

apt-get update -y

apt-get remove apache2 -y

apt-get install nginx mariadb-server -y 

systemctl enable nginx 

systemctl enable mariadb

apt-get install php php-mysql php-cli php-cgi php-gd php-mbstring php-xml php-xmlrpc php-soap php-intl php-zip php-curl php-imagick php-fpm -y

mkdir -p /var/www/html/wordpress

cp wordpressnginx.conf /etc/nginx/sites-available/wordpressnginx.conf


ln -s /etc/nginx/sites-available/wordpressnginx.conf  /etc/nginx/sites-enabled/wordpressnginx.conf

systemctl restart nginx 

cd /var/www/html/wordpress

wget https://wordpress.org/latest.tar.gz

tar -xvf latest.tar.gz

mv wordpress/*  /var/www/html/wordpress

chown -R www-data:www-data /var/www/html/wordpress

chmod -R 755 /var/www/html/wordpress

sed -i -e s/example.com/"$name"/g /etc/nginx/sites-available/wordpressnginx.conf

wget https://files.anirbandutta.in/mysqldbcreate.sh

chmod +x mysqldbcreate.sh

./mysqldbcreate.sh --host=localhost --database=wordpress --user=wordpressuser

sed -ri 's/.*(listen = ).*/\1127.0.0.1:9000/g' /etc/php/7.4/fpm/pool.d/www.conf

sed -ri 's/.*(listen = ).*/\1127.0.0.1:9000/g' /etc/php/7.2/fpm/pool.d/www.conf

sed -ri 's/.*(listen = ).*/\1127.0.0.1:9000/g' /etc/php/7.3/fpm/pool.d/www.conf

sed -ri 's/.*(listen = ).*/\1127.0.0.1:9000/g' /etc/php/7.1/fpm/pool.d/www.conf


sed -ri 's/.*(listen = ).*/\1127.0.0.1:9000/g' /etc/php/7.0/fpm/pool.d/www.conf

systemctl restart php7.4-fpm
systemctl restart php7.3-fpm
systemctl restart php7.2-fpm
systemctl restart php7.1-fpm
systemctl restart php7.0-fpm
systemctl restart nginx 

echo  "Installation Completed Successfully . Please point" $name "to server Public IP address in your Domain DNS"

echo "You will see database details are listed above. Use them to complete the installation by visiting -> http://"$name  

