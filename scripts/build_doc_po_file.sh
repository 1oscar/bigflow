#!/bin/sh

git_setup() {
    git config --global user.email "travis@travis-ci.org"
    git config --global user.name "Travis CI"
}

copy_file() {
    cp -rf doc/locales/en/LC_MESSAGES/*.po build_doc_po_file/bigflow/doc/locales/en/LC_MESSAGES/
    cp -rf doc/locales/zh/LC_MESSAGES/*.po build_doc_po_file/bigflow/doc/locales/zh/LC_MESSAGES/
}

git_add() {
    git checkout doc
    git add doc/locales/en/LC_MESSAGES/*.po
    git add doc/locales/zh/LC_MESSAGES/*.po
    git commit -m "Update po files: $TRAVIS_BUILD_NUMBER"
}

git_push() {
    git remote add origin-doc https://$GITHUB_TOKEN@github.com/yshysh/bigflow.git
    git push --set-upstream origin-doc doc
}

sudo chown -R travis:travis /home/travis/

git_setup

copy_file

cd build_doc_po_file/bigflow

if git diff --quiet; then
    echo "No changes to the output on this push; exiting."
    exit 0
fi

git_add

git_push
