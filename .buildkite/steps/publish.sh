#!/bin/bash
set -euo pipefail

OIDC_TOKEN=$(buildkite-agent oidc request-token --audience "https://packages.buildkite.com/anothertest/starter-pipeline" --lifetime 300)
echo "Hello $OIDC_TOKEN"
curl -X POST https://api.buildkite.com/v2/packages/organizations/anothertest/registries/myterra/packages -H "Authorization: Bearer $OIDC_TOKEN" -F "file=@ksh_all-1.0.4.tgz"
