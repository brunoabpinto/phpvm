if [ -f "$HOME/.zshrc" ]; then
    if ! grep -q ".phpvm.sh" $HOME/.zshrc; then
        echo  "\n\n#PHPVM source\nif [[ -r \"$HOME/phpvm/phpvm.sh\" ]];then\n\tsource \"$HOME/phpvm/phpvm.sh\"\nfi"  >>  $HOME/.zshrc
        echo 'PHPVM installed in zshell. Reloading shell'
        zsh
    else
        echo 'PHPVM already installed in .zshrc. Skipping'
    fi
fi
if [ -f "$HOME/.bashrc" ]; then
    if ! grep -q ".phpvm.sh" $HOME/.bash; then
        echo  "\n\n#PHPVM source\nif [[ -r \"$HOME/phpvm/phpvm.sh\" ]];then\n\tsource \"$HOME/phpvm/phpvm.sh\"\nfi"  >>  $HOME/.bashrc
        echo 'PHPVM installed in bash. Reloading shell'
        bash
    else
        echo 'PHPVM already installed in .zshrc. Skipping'
    fi
fi
if [ ! -f "$HOME/.zshrc" &&  ! -f "$HOME/.bashrc"]; then
    echo 'Please install zshell or bash to run PHPVM'
fi