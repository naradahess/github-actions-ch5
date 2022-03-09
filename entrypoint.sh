#!/bin/bash
set -e

if [ -n "$GITHUB_EVENT_PATH" ]; then
    EVENT_PATH=$GITHUB_EVENT_PATH
else
    echo "No JSON data to process! :("
    exit 1
fi

env
jq . < $EVENT_PATH

if jq '.commits[].message, .head_commit.message' < $EVENT_PATH | grep -i -q "$*"; then
    echo "Found the keyword"
else
    echo "Nothing to process."
fi
