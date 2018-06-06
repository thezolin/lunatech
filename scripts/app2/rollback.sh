#!/bin/bash
WORKING_DIR="/home/vagrant/lunatech"
EXISTING_LINK="airports-current.jar"
NEW_LINK="/home/vagrant/lunatech/airports-assembly-1.1.0.jar airports-current.jar"

echo
echo
echo

echo "Starting deployment of Airport service..."

cd $WORKING_DIR

echo "Removing previous versions..."

rm -rf $EXISTING_LINK

echo "Creating new symlink with new artifact..."

ln -s $NEW_LINK

echo "Executing service restart..."
sudo systemctl stop airports.service
sudo systemctl start airports.service

echo "Deployment done. SUCCESSFUL!"

vagrant@lunatech_app2:~/lunatech$ cat rollback.sh
#!/bin/bash
WORKING_DIR="/home/vagrant/lunatech"
EXISTING_LINK="airports-current.jar"
NEW_LINK="/home/vagrant/lunatech/airports-assembly-1.0.1.jar airports-current.jar"

echo
echo
echo


echo "Starting Rollback of previous deployment of Airport service..."

cd $WORKING_DIR

echo "Removing previous versions..."

rm -rf $EXISTING_LINK

echo "Creating new symlink with old artifact..."

ln -s $NEW_LINK

echo "Executing service restart..."
sudo systemctl stop airports.service
sudo systemctl start airports.service

echo "Rollback  done. SUCCESSFUL!"
