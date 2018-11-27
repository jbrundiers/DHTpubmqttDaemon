# DHTpubMqttDaemon for Raspberry PI

A daemon reading the data of an DHT22 connected to an Raspberry PI. The read data is transfered to an MQTT server with a given topic.

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. 

### Hardware prerequisites

You need a [Raspberry PI board](http://www.raspberrypi.org/) and a DHT22 sensor connected to Pin 7 (GPIO4) of the Raspberry to use this daemon.

![Wiring](/DHTwiring.PNG?raw=true)

### Software prerequisites

The daemon uses 3 non standard libraries which must be installed first:

**libconfig-dev** - This library allows parsing, manipulating and writing structured configuration files.
``` code
apt-get install libconfig-dev
```
**libmosquitto-dev** - Library for implementing MQTT version 3.1/3.1.1 clients.
``` code
apt-get install libmosquitto-dev
```
**wiringpi** - [Wiring Pi](http://wiringpi.com/) GPIO Interface library for the Raspberry Pi
``` code
apt-get install wiringpi 
```
**MQTT server** - MQTT server running and reachable form the Raspberry.

### Installing
1. Build the executable file by running "make"
``` code
cd ~/dhtpubmqttd
make
```
2. Edit the config file dhtpubmqttd.conf according to your needs
``` code
nano dhtpubmqttd.conf
```
3. Copy the binary dhtpubmqttd and the config file dhtpubmqttd.conf to /opt/dhtpubmqttd/
``` code
sudo mkdir /opt/dhtpubmqttd
sudo cp dhtpubmqttd /opt/dhtpubmqttd
sudo cp dhtpubmqttd.conf /opt/dhtpubmqttd
```
4. Copy the service configuration file DHTpubMqttDaemon.service to /lib/systemd/system/
``` code
sudo cp DHTpubMqttDaemon.service /lib/systemd/system/
```
5. Enable DHTpubMqttDaemon service
``` code
sudo systemctl enable DHTpubMqttDaemon.service
```
6. Start DHTpubMqttDaemon.service
``` code
sudo systemctl start DHTpubMqttDaemon.service
```
7. check syslog for errors
``` code
tail -f /var/log/syslog
```
8. Start an MQTT client and subscripe the topic configured in the config file. You should get a string in JSON format with the read data.
``` code
{"Humidity":"42.00","Temperature":"20.10"}
```


## License

This project is licensed under the GNU General Public License - see the [LICENSE](LICENSE) file for details


