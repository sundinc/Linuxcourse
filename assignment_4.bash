#!/bin/bash
SEARCHPATH='/usr/share/pixmaps/'

ls -l $SEARCHPATH | sed -n '/.xpm/p; /.png/p' >newfile 

