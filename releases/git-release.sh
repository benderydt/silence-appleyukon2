#!/bin/bash
# git release script

if [ $# -ne 1 ]
then
    echo "Usage: $0 valid-git-tag" >&2
    exit 1
fi

TAG="$1"
RELEASES_D="releases"

if ! git tag -l "$TAG" | grep "^$TAG$" &>/dev/null
then
	echo "Tag '$TAG' doesn't exist" >&2
	exit 2
fi
git archive --prefix="silence-appleyukon2-$TAG/" -o "silence-appleyukon2-$TAG.zip" "$TAG" 
