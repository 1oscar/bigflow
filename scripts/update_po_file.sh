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
    git push --quiet --follow-tags "https://$GITHUB_TOKEN@github.com/$TRAVIS_REPO_SLUG" "$TRAVIS_BRANCH"
}

git_setup
git_add
git_push
