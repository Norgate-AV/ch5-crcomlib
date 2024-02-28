#!/usr/bin/env bash
# shellcheck disable=SC1091

set -ex

. get_build_version.sh

if [[ "${SHOULD_BUILD}" == "yes" ]]; then
    echo "CH5_COMMIT=\"${CH5_COMMIT}\""

    . prepare.sh

    cd ${GITHUB_WORKSPACE}/${UPSTREAM_PROJECT} || {
        echo "'${UPSTREAM_PROJECT}' dir not found"
        exit 1
    }

    # npm run build:prod_all
    npm run build:prod:esm
    npm run build:prod:esm-no-ce

    pwd
    ls -la ${GITHUB_WORKSPACE}/${UPSTREAM_PROJECT}/build_bundles

    cd ${GITHUB_WORKSPACE} || ..
fi
