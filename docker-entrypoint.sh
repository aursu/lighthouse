#!/bin/sh
set -e

if [ "${1#-}" != "${1}" ] || [ -z "$(command -v "${1}")" ]; then
  if [ -n "$RUN_DESCRIPTION" -a "$RUN_DESCRIPTION" = "lhr" ]; then
    output_name="lhr"
  else
    output_name=$(echo $RUN_DESCRIPTION | sed 's/[[:punct:][:space:]]\+/_/g')
  fi

  if [ -f custom-config.js ]; then
    set -- lighthouse --chrome-flags="--no-sandbox --headless" --config-path=custom-config.js --output=json --output=html --output-path=reports/$output_name-$(date +%Y-%m-%d_%H-%M-%S) "$@"
  else
    set -- lighthouse --chrome-flags="--no-sandbox --headless" --output=json --output=html --output-path=reports/lhr-$(date +%Y-%m-%d_%H-%M-%S) "$@"
  fi
fi

exec "$@"