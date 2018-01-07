#!/bin/sh

git_setup() {
    git config --global user.email "travis@travis-ci.org"
    git config --global user.name "Travis CI"
}

git_add() {
    git add doc/locales/en/LC_MESSAGES/*.po
    git add doc/locales/zh/LC_MESSAGES/*.po
    git commit --message "Update po files: $TRAVIS_BUILD_NUMBER"
}

git_push() {
    git remote add origin-test https://$GITHUB_TOKEN@github.com/yshysh/bigflow.git
    git push --quiet --set-upstream origin-test test
}

git_setup
git_add
git_push
