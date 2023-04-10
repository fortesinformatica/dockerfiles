#!/bin/bash

set -eo pipefail
set -x

docker build -t="fortes/circleci:building" .
docker run --rm -v "$PWD:/test" "fortes/circleci:building" bash /test/test.sh
docker tag "fortes/circleci:building" "fortes/circleci:2023-02" # Ruby 3.2.2
