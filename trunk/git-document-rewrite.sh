#!/bin/bash

function rewrite() {
  infile=$1
  outfile=$2/`basename $1`
  echo "$infile -> $outfile"
  sed -f rewrite.sed <$infile >$outfile
}

for infile in git-doc-orig/*.html; do
  rewrite $infile git-doc
done

for infile in git-doc-orig/technical/*.html; do
  rewrite $infile git-doc/technical
done

for infile in git-doc-orig/howto/*.html; do
  rewrite $infile git-doc/howto
done
