#!/bin/bash

tar zxvf OpenLayers-2.13.1.tar.gz
mv OpenLayers-2.13.1 webapps/map/OpenLayers
#
tar zxvf dojo-release-1.9.4.tar.gz
mkdir webapps/map/js/
mv dojo-release-1.9.4 webapps/map/js/dojo-1.9
#
unzip IPAfont00303.zip
mkdir webapps/map/WEB-INF
mv IPAfont00303 webapps/map/WEB-INF/fonts

