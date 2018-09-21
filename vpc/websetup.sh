sudo yum update -y
sudo yum install httpd wget unzip -y
wget -O website.zip http://www.tooplate.com/download/2107_new_spot
unzip website.zip
cp -r 2107_new_spot/* /var/www/html
sudo service restart httpd
sudo chkconfig httpd on
