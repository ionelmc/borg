#!/bin/bash

set -e
set -x

NO_COVERAGE_TOXENVS=(pep8)
if ! [[ "${NO_COVERAGE_TOXENVS[*]}" =~ "${TOXENV}" ]]; then
    source ~/.venv/bin/activate
    ln .tox/.coverage .coverage
    if [[ "$(uname -s)" == "Darwin" ]]; then
        # tests run as root, so access coverage file also as root
        sudo codecov -e TRAVIS_OS_NAME TOXENV
    else
        codecov -e TRAVIS_OS_NAME TOXENV
    fi
fi
