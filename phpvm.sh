#!/bin/bash

function phpvm()
    if [[ $1 == "install" ]]; then
        python3 ~/Projects/phpvm/version_installer.py install

    elif [[ $1 == "remove" ]]; then
        python3 ~/Projects/phpvm/version_installer.py remove

    elif [[ $1 == "use" ]]; then
        for VERSION in /opt/homebrew/opt/php@$2*; do
            export PATH="$VERSION/bin:$PATH"
            break
        done
        php -v

    elif [[ $1 == "default" ]]; then
        for VERSION in /opt/homebrew/opt/php@$2*; do
            if ! grep -q ".phpvm_default.sh" ~/.zshrc; then
                echo '\n\n# PHPVM default PHP version\nif [[ -r "$HOME/.phpvm_default.sh" ]]; then\n\tsource "$HOME/.phpvm_default.sh"\nfi' >> ~/.zshrc
            fi
            echo "export PATH=\"${VERSION}/bin:\$PATH\"" > ~/.phpvm_default.sh
            zsh
            break
        done
        php -v

    elif [[ $1 == "list" ]]; then
        for VERSION in /opt/homebrew/opt/php@$2*; do
            echo $VERSION
        done
    fi
