#!/bin/sh

git_setup() {
    git config --global user.email "travis@travis-ci.org"
    git config --global user.name "Travis CI"
}

git_add() {
    git add ../doc/locales
    git commit --message "Update po files: $TRAVIS_BUILD_NUMBER"
}

git_push() {
    git push origin test
}

git_setup
git_add
git_push
