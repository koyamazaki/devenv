#!/bin/bash

# bg process
/usr/sbin/sshd

# main process
tail -f /dev/null
