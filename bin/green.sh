#!/bin/bash

# STEP 2 : GREEN

# Run phpunit
vendor/bin/phpunit --no-coverage

# Get return value
phpunit_return_value=$?

# Tests SHOULD pass
if [ $phpunit_return_value -eq 0 ]
then
    echo -e "\n\e[1m\e[32m✔ Unit tests passed. Continue to refactor.\e[0m"
    exit 0
else
    echo -e "\n\e[1m\e[31m✘ Unit tests failed. Make them pass.\e[0m"
    exit 1
fi
