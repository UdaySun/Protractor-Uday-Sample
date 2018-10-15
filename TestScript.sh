#!/bin/bash
#Starting dbus daemon and exporting related environmental variables
#export $(dbus-launch)
echo "We are going to clone latest code to docker image"
#Starting X server to be able to run firefox
Xvfb :1 -screen 0 1200x800x24 &

# Clean the target with reports
rm -rf reports

echo npm -v
# Install all dependencies
DISPLAY=:1.0 npm install


# Run tests
DISPLAY=:1.0 protractor conf.js