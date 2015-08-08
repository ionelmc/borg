#!/bin/bash

set -e
set -x

NO_COVERAGE_TOXENVS=(pep8)
if ! [[ "${NO_COVERAGE_TOXENVS[*]}" =~ "${TOXENV}" ]]; then
    echo "TRAVIS_OS_NAME,TOXENV = $TRAVIS_OS_NAME,$TOXENV"
    source ~/.venv/bin/activate
    ln .tox/.coverage .coverage
    echo "TRAVIS_OS_NAME,TOXENV = $TRAVIS_OS_NAME,$TOXENV"
    codecov -e TRAVIS_OS_NAME,TOXENV
fi
