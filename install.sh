if [ -f "$HOME/.zshrc" ]; then
    echo  "\n\n#PHPVM source\nif [[ -r \"$HOME/phpvm/phpvm.sh\" ]];then\n\tsource \"$HOME/phpvm/phpvm.sh\"\nfi"  >>  $HOME/.zshrc
    echo 'PHPVM installed in zshell. Reloading shell'
    zsh
elif [ -f "$HOME/.bashrc" ]; then
    echo  "\n\n#PHPVM source\nif [[ -r \"$HOME/phpvm/phpvm.sh\" ]];then\n\tsource \"$HOME/phpvm/phpvm.sh\"\nfi"  >>  $HOME/.bashrc
    echo 'PHPVM installed in bash. Reloading shell'
    bash
else
    echo 'Please install zshell or bash to run PHPVM'
fi