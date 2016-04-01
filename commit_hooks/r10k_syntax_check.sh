#!/bin/bash
#
# This script assumes you have installed r10k and will perform a syntax check on the Puppetfile if existing

# if USE_BUNDLER is set to enabled then we use bundle exec metadata-json-lint
if [[ $USE_BUNDLER == "enabled" ]] ; then
    r10k_binary="bundle exec r10k"
else
    r10k_binary="r10k"
fi

echo "Performing a syntax check on the r10k Puppetfile:"
PUPPETFILE="$1" $r10k_binary puppetfile check

if [[ $? -ne 0 ]]
then
	exit 1
fi
