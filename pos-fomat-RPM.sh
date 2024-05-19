#!/bin/bash

#VARIÁVEIS, POIS POR SE TRATAR DE LINKS EXTERNOS PODEM SER ALTERADAS
rpm="https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm"
programs="gparted zsh gnome-tweaks util-linux-user powerline powerline-fonts google-chrome-stable"
flatpack="flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo"
separacao="-----------****-----------"

echo $separacao
echo "ATUALIZANDO SISTEMA APÓS A FORMATAÇÃO"
echo "by Jefferson Silva v1"
echo $separacao
echo "HABILITANDO RPM FUSION FREE E NONFREE"
sudo dnf install $rpm -y

echo $separacao

echo "INSTALANDO REPOSITORIO DE TERCEIRO"
sudo dnf install fedora-workstation-repositories -y

echo $separacao

echo "HABILITANDO REPOSITORIO DO GOOGLE"
sudo dnf config-manager --set-enabled google-chrome

echo $separacao

echo "ATUALIZANDO SISTEMA"
sudo dnf update -y

echo $separacao

echo "INSTALANDO COMPLEMENTOS"
sudo dnf install $programs -y

echo $separacao

echo "ATIVANDO O FLATPACK"
sudo $flatpack

echo $separacao

echo "INSTALANDO VLC VIA FLATPACK"
flatpak install flathub org.videolan.VLC -y

echo $separacao

echo "LIMPANDO CACHE DE ATUALIZAÇÕES"
dnf clean all

echo $separacao

echo "EXCLUINDO VERSÕES ANTERIORES DO OH-MY-ZSH"
if [ -d ~/.oh-my-zsh ];
    then
echo "ESSE DIRETÓRIO JÁ EXISTE E SERÁ REMOVIDO"
    rm -Rf ~/.oh-my-zsh
rm ~/.zshrc
echo "REMOÇÃO CONCLUÍDA"
    echo $separacao
    echo "INSTALANDO OH-MY-ZSH"
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    echo $separacao
    echo "FIM DO PROGRAMA"
    
    else
    echo "INSTALANDO OH-MY-ZSH"
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    echo $separacao
    echo "FIM DO PROGRAMA"
fi