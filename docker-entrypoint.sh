#!/bin/sh
set -e

if [ "${1#-}" != "${1}" ] || [ -z "$(command -v "${1}")" ]; then
  set -- lighthouse --chrome-flags="--no-sandbox --headless" --output=json --output-path=lhr-$(date +%Y-%m-%d_%H-%M-%S).report.json "$@"
fi

exec "$@"