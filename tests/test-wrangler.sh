#! /usr/bin/env bash

# a very simple script to test basic wrangler functionality. This should
# be run within a directory which contains a wrangler project.

echo
echo "*** WRANGLER-TEST***: Running basic wrangler tests - note that you should be in a directory"
echo "*** WRANGLER-TEST***: which contains a valid wrangler application for this to work; usually"
echo "*** WRANGLER-TEST***: there is a wrangler.toml in this directory. You will also need to be"
echo "*** WRANGLER-TEST***: authenticated against cloudflare for this to work."
echo

echo
echo "*** WRANGLER-TEST***: Obtaining wrangler version..."
wrangler version

echo
echo "*** WRANGLER-TEST***: Listing wrangler databases..."
wrangler d1 list

echo
echo "*** WRANGLER-TEST***: Running wrangler dev (press Ctrl-C to exit)..."
wrangler dev

echo
echo "*** WRANGLER-TEST***: Running wrangler deploy..."
wrangler deploy

echo
echo "*** WRANGLER-TEST***: All done!"
echo
