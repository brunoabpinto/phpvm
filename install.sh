if [ -f "$HOME/.zshrc" ]; then
    if ! grep -q ".phpvm.sh" $HOME/.zshrc; then
        printf  "\n\n#PHPVM source\nif [[ -r \"$HOME/phpvm/phpvm.sh\" ]];then\n\tsource \"$HOME/phpvm/phpvm.sh\"\nfi"  >>  $HOME/.zshrc
        echo 'PHPVM installed in zshell. Reloading shell'
    else
        echo 'PHPVM already installed in .zshrc. Skipping'
    fi
fi
if [ -f "$HOME/.bashrc" ]; then
    if ! grep -q ".phpvm.sh" $HOME/.bashrc; then
        printf  "\n\n#PHPVM source\nif [[ -r \"$HOME/phpvm/phpvm.sh\" ]];then\n\tsource \"$HOME/phpvm/phpvm.sh\"\nfi"  >>  $HOME/.bashrc
    else
        echo 'PHPVM already installed in .bashrc. Skipping'
    fi
fi

# Reload shell to apply changes
if [ $SHELL == '/bin/zsh' ]; then
    zsh
elif [ $SHELL == '/bin/bash' ]; then
    bash
fi