#!/bin/bash
# Prints the environment variables when activating un-packed environment
export PATH=/usr/bin:/bin

source {{ENVIRONMENT_DIR}}/$1/bin/activate
/bin/env