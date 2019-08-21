#!/usr/bin/env bash

# Scripts for R
if [ "$TARGET" = "R" ]; then
  Rscript -e 'covr::codecov()'
  cat hBayesDM.Rcheck/00*

# Scripts for Python
elif [ "$TARGET" = "Python" ]; then
  flake8 hbayesdm --format=pylint --statistics --exit-zero
  pylint hbayesdm --rcfile=setup.cfg --exit-zero

# Otherwise
else
  echo 'No after-success job required'
fi