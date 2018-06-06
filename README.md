# lunatech
Lunatech´s DevOps test

Services information -----

Countries service:
	Service installed at app1 server, IP 192.168.56.3
	To access this service, just type http://192.168.58.5:8000/countries

Airports service:
	Service installed at app1 server, IP 192.168.57.4	
        To access this service, just type http://192.168.58.5:8000/airports


Deployment Instructions -----

NOTE: This environment was created using Vagrant and VirtualBox 5.1. All the servers runs ubuntu 16.04.LTS 64-Bit mode. 

1) Download all boxes from this link: https://drive.google.com/open?id=1269YJ-FH61K1q6iD-rD1ur6XGOLLmUwz

2) Unzip the dowloaded file and click on readme.txt file to install all the boxes on your computer. 

3) After all servers ar up, please access all services by your browser using the reverse proxy:

 		a) Country service: http://192.168.58.5:8000/countries
		b) Airports service: http://192.168.58.5:8000/airports

4) To make a deployment on Airports service, please access Jenkins thru http://192.168.58.5:8080 with these credentials:
	login: admin
	password: lunatech123

5) On Jenkins main screen, click on Pipelines, and then click on "airports_deployment_pipeline". 

6) Click on Build Now, on left menu. Voilà, Deployment done!. 

7) After deployment access the new version of airports service using:
To access this service, just type http://192.168.58.5:8000/airports or http://192.168.58.5:8000/search



Information about scripts ---------

All scripts used on this solution is available at "scripts" folder on this repository. 

APP1 - Countries service - 192.168.56.3
---countries.sh -> Responsible to bring the countries service up. This script is located at /usr/local/bin folder
---start-iptables -> Responsible to enable all iptables rules on this machine. This script is located at /etc/init.d folder

APP2 - Airports service / Jenkins slave node - - 192.168.57.4
---airports.sh -> Responsible to bring the airports service up. This script is located at /usr/local/bin folder
---deployment.sh -> Responsible to executing deployment of airports-assembly-1.1.0.jar file. This script is located at /home/vagrant/lunatech folder
---rollback.sh -> Responsible to executing rollback of airports-assembly-1.1.0.jar to previous version. This script is located at /home/vagrant/lunatech folder
---start-iptables -> Responsible to enable all iptables rules on this machine. This script is located at /etc/init.d folder


LB - Load Balancer/Reverse Proxy/ Jenkins master - 192.168.58.5
---nodeapp.conf -> Nginx configuration file for reverse proxy function



	 