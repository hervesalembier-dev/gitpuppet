#!/bin/sh
if [ -f ~/hello.txt ]; then
  echo "Hello muppet"  
  cat ~/hello.txt;
else  
  echo 'Hello from Puppet'
fi