#!/bin/bash

cd config && rsync -avz zsh/.zsh ~ && rsync zsh/.zshrc ~
