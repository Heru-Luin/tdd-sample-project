#!/bin/bash

# STEP 1 : RED

# Run phpunit
vendor/bin/phpunit --no-coverage

# Get return value
phpunit_return_value=$?

# Tests SHOULD fail
if [ $phpunit_return_value -eq 0 ]
then
    echo -e "\n\e[1m\e[31m✘ Unit tests passed. Make them fail.\e[0m"
    exit 1
else
    echo -e "\n\e[1m\e[32m✔ Unit tests failed. Continue to green.\e[0m"
    exit 0
fi
