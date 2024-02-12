#  Version manager for PHP

Assumes you have your PHP versions installed with homebrew on ```/opt/homebrew/opt/php@*```.
Inspired by NVM.

## Install

Just paste this command in your terminal and you're ready to go

```bash
cd  ~/  &&  wget  https://raw.githubusercontent.com/brunoabpinto/phpvm/main/phpvm.sh  &&  echo  '\n\n#PHPVM source\nif [[ -r "$HOME/phpvm.sh" ]];then\n\tsource "$HOME/phpvm.sh"\nfi'  >>  .zshrc  &&  zsh
```

## Example commands:

#### List PHP installed versions
```bash
$ phpvm list

/opt/homebrew/opt/php@7.0
/opt/homebrew/opt/php@7.1
/opt/homebrew/opt/php@7.2
/opt/homebrew/opt/php@7.4
/opt/homebrew/opt/php@8.1
```

#### Change PHP version
```bash
$ phpvm use 8

PHP 8.1.27 (cli) (built: Dec 19 2023 20:35:55) (NTS)
Copyright (c) The PHP Group
Zend Engine v4.1.27, Copyright (c) Zend Technologies
    with Zend OPcache v8.1.27, Copyright (c), by Zend Technologies
```

#### Set default PHP version
```bash
$ phpvm default 8
```