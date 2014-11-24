#!/bin/bash

set -e

echo "export ROLES=$ROLES" >> /root/.bashrc
service codedeploy-agent $1
exec tail -qF -n 0 /var/log/aws/codedeploy-agent/codedeploy-agent.log
