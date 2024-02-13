#!/bin/bash

function phpvm()
    if [[ $1 == "install" ]]; then
        python3 $HOME/phpvm/version_installer.py install

    elif [[ $1 == "remove" ]]; then
        python3 $HOME/phpvm/version_installer.py remove

    elif [[ $1 == "use" ]]; then
        for VERSION in /opt/homebrew/opt/php@$2*; do
            export PATH="$VERSION/bin:$PATH"
            break
        done
        php -v

    elif [[ $1 == "default" ]]; then
        for VERSION in /opt/homebrew/opt/php@$2*; do
            if ! grep -q ".phpvm/default.sh" $HOME/.zshrc; then
                print '\n\n# PHPVM default PHP version\nif [[ -r "$HOME/.phpvm/default.sh" ]]; then\n\tsource "$HOME/.phpvm/default.sh"\nfi' >> $HOME/.zshrc
            fi
            if ! grep -q ".phpvm/default.sh" $HOME/.bashrc; then
                print '\n\n# PHPVM default PHP version\nif [[ -r "$HOME/.phpvm/default.sh" ]]; then\n\tsource "$HOME/.phpvm/default.sh"\nfi' >> $HOME/.bashrc
            fi
            print "export PATH=\"${VERSION}/bin:\$PATH\"" > $HOME/phpvm/default.sh
            zsh
            break
        done
        php -v

    elif [[ $1 == "list" ]]; then
        for VERSION in /opt/homebrew/opt/php@$2*; do
            echo $VERSION
        done
    fi
