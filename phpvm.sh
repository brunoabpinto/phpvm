# PHPVM default PHP version
if [[ -r "$HOME/phpvm/default.sh" ]]; then
	source "$HOME/phpvm/default.sh"
fi

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
            printf "export PATH=\"${VERSION}/bin:\$PATH\"" > $HOME/phpvm/default.sh
            break
        done

    elif [[ $1 == "list" ]]; then
        for VERSION in /opt/homebrew/opt/php@$2*; do
            echo $VERSION
        done
    fi