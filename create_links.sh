#!/bin/bash
rm /home/$USER/.vimrc
ln -s  /home/$USER/configuration/.vimrc /home/$USER/.vimrc
rm /home/$USER/.bashrc
ln -s  /home/$USER/configuration/.bashrc /home/$USER/.bashrc
