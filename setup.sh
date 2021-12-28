#!/bin/bash

uname=`uname -a`

install_ohmyzsh() {
    if [ [ $uname =~ "ubuntu" ] ]; then
        sudo apt update
        sudo apt install -y zsh
    fi
    sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    exit
}

install_plug() {
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
    echo "将以下内容添加到.zshrc中"
    echo "zsh-autosuggestions zsh-syntax-highlighting"
}


while [ 1 == 1 ]
    do
        PS3="Please select a option:"
        re="^[1-9][0-9]*$"
        select opt in "安装 oh my zsh" \
                    "zsh 安装插件" \
                    "退出" ; do

            if ! [[ $REPLY =~ $re ]] ; then
                echo -e "${COLOR_ERROR}Invalid option. Please input a number.${COLOR_NONE}"
                echo "$REPLY"
                break;
            elif (( $REPLY == 1  )) ; then
                install_ohmyzsh
                break
            elif (( $REPLY == 2 )) ; then
                install_plug
                break
            elif (( $REPLY == 3 )) ; then
                exit
            else
                echo -e "${COLOR_ERROR}Invalid option. Try another one.${COLOR_NONE}"
            fi
        done
    done