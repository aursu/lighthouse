#!/bin/sh
set -e

if [ "${1#-}" != "${1}" ] || [ -z "$(command -v "${1}")" ]; then
  mkdir -p reports
  if [ -f custom-config.js ]; then
    set -- lighthouse --chrome-flags="--no-sandbox --headless" --config-path=custom-config.js --output=json --output-path=reports/lhr-$(date +%Y-%m-%d_%H-%M-%S).report.json "$@"
  else
    set -- lighthouse --chrome-flags="--no-sandbox --headless" --output=json --output-path=reports/lhr-$(date +%Y-%m-%d_%H-%M-%S).report.json "$@"
  fi
fi

exec "$@"