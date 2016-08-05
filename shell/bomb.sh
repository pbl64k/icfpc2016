#!/bin/sh
DIR=`dirname "$(readlink -f "$0")"`
for PROB in $(seq 1 101); do
  echo "Submitting $PROB"
  $DIR/sol-submit.sh "$PROB" $DIR/../scratch/sol.txt
  echo "\nOk."
  sleep 5;
done
