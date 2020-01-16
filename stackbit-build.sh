#!/usr/bin/env bash

set -e
set -o pipefail
set -v

curl -s -X POST https://api.stackbit.com/project/5e201d72940ca4001bad5d11/webhook/build/pull > /dev/null
npx @stackbit/stackbit-pull --stackbit-pull-api-url=https://api.stackbit.com/pull/5e201d72940ca4001bad5d11
curl -s -X POST https://api.stackbit.com/project/5e201d72940ca4001bad5d11/webhook/build/ssgbuild > /dev/null
npm run build
curl -s -X POST https://api.stackbit.com/project/5e201d72940ca4001bad5d11/webhook/build/publish > /dev/null
