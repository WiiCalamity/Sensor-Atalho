#!/bin/bash
oldName=`git config --global user.name`
oldEmail=`git config --global user.email`
read -p "git config --global user.name: " myName
read -p "git config --global user.email: " myEmail
printf "${oldName}\n${oldEmail}" > oldUser.txt

git config --global user.name "${myName}"
git config --global user.email "${myEmail}"

read -p "Mensagem do commit: " message
read -p "Confirma? (s/N): " confirm
[[ ${confirm} != "s" ]] && exit

git add .
git commit --message="${message}"
git push

git config --global user.name "${oldName}"
git config --global user.email "${oldEmail}"
exit
