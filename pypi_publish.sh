#!/usr/bin/env sh

# Script made to publish the package to https://pypi.python.org/pypi/discord.aio

# Go to script directory
cd `(dirname $0)`

# Cleanup
rm -rf dist/
rm -rf build/
rm -rf *.egg-info

# Generate files
python3 setup.py sdist
python3 setup.py bdist

# Sign
gpg --detach-sign -a dist/*.tar.gz

# Upload
twine upload dist/*