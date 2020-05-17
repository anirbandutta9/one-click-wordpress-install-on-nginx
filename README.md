# One-Click-Wordpress-Install-on-Nginx-
One click automatic WordPress install with nginx on Ubuntu 16.04 / 18.04 / 20.04 

### This tool will help anyone deploy WordPress on Ubuntu server easily and automatically. Users don't need to do any server side setup.  

## The following packages will be installed and setup automatically by this tool ->
1) nginx 
2) Wordpress latest version
3) PHP 7 ,  PHP-FPM
4) MariaDB 10

## Requirements ->
1) Blank Ubuntu server ( perfectly works with Ubuntu 16.04, 18.04, 20.04 )
2) Minimum 1vCPU, 1 GB RAM, 10 GB DISK


## Installation Guide ->

How to install this tool and run - (switch to root user before running this tool)

```sh
apt-get install git  
git clone https://github.com/anirbandutta9/leap-year-calculate.git  
chmod +x install.sh  
./install.sh  
```

You will be prompted to put root MySql server password in between. Just leave it blank and press enter to continue if you have not already setup mysql root password. Else just put your password.

Database credentials will be shown automatically after installation. 

## After installation 

After the installation is complete just point your domain to server Public IP with DNS records and your domain will be live.


## If this project helped you reduce time to develop, feel free to give me a cup of coffee :)
https://www.anirbandutta.in/pay/   


    

Thanks to @MagePsycho for mysql database creation tool which I am using with this tool.  
https://gist.github.com/MagePsycho/823070addf1764c91b86f258767a62d1

