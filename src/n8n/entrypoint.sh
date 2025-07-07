#!/bin/sh

pwd

if [ -f /home/node/.n8n/.prosioned ]; then
  echo "Already provisioned"
  n8n start
  exit 0
fi

echo IMPORTING CCREDENTIALS
n8n import:credentials --separate --input=/credentials
n8n import:workflow --separate --input=/workflows

echo PROSIONED
touch /home/node/.n8n/.prosioned
