#!/bin/bash
# Prints the environment variables when activating un-packed environment
export PATH=/usr/bin:/bin

source {{APPS_LOCATION}}/$1/bin/activate
/bin/env