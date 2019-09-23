#!/bin/bash

##########################################
## STEP 3 : REFACTOR
##########################################


##########################################
# PHP Code Sniffer
# ----------------------------------------
# Run phpcs to get code formatting errors
##########################################

vendor/bin/phpcs > /dev/null

# Get return value
phpcs_return_value=$?

# phpcs SHOULD pass
if [ $phpcs_return_value -eq 0 ]
then
    echo -e "\n\e[1m\e[32m✔ Code Sniffer OK.\e[0m"
else
    echo -e "\n\e[1m\e[31m✘ Code Sniffer KO, running Code Beautifier and Fixer.\e[0m"

    ##########################################
    # PHP Code Beautifier and Fixer
    # ----------------------------------------
    # Autofix formatting errors
    ##########################################

    vendor/bin/phpcbf > /dev/null

    ##########################################
    # PHP Code Sniffer (Again)
    # ----------------------------------------
    # Run phpcs to get code formatting errors
    ##########################################

    vendor/bin/phpcs

    # Get return value
    phpcs_return_value2=$?

    # phpcs SHOULD pass
    if [ $phpcs_return_value2 -eq 0 ]
    then
        echo -e "\n\e[1m\e[32m✔ Code Sniffer OK.\e[0m"
    else
        echo -e "\n\e[1m\e[31m✘ Code Sniffer KO.\e[0m"
        exit 1
    fi
fi

##########################################
# PHPUnit
##########################################

vendor/bin/phpunit --no-coverage

# Get return value
phpunit_return_value=$?

# phpunit SHOULD pass
if [ $phpunit_return_value -eq 0 ]
then
    echo -e "\n\e[1m\e[32m✔ Unit tests passed. Keep on refactoring or switch to the next test.\e[0m"
    exit 0
else
    echo -e "\n\e[1m\e[31m✘ Unit tests failed. Make them pass.\e[0m"
    exit 1
fi
