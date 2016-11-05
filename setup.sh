#!/bin/bash

git clone git@github.com:NgaNguyenDuy/config.git && cd config && rsync -avz zsh/.zsh ~ && rsync zsh/.zshrc ~
