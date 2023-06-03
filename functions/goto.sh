#!/bin/bash
git checkout $1
if [ $? -ne 0 ]; then
  git checkout -b $1
  git push --set-upstream origin $1
fi
