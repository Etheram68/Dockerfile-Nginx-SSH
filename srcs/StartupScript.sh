# **************************************************************************** #
#                                                           LE - /             #
#                                                               /              #
#    StartupScript.sh                                 .::    .:/ .      .::    #
#                                                  +:+:+   +:    +:  +:+:+     #
#    By: frfrey <frfrey@student.le-101.fr>          +:+   +:    +:    +:+      #
#                                                  #+#   #+    #+    #+#       #
#    Created: 2020/01/31 20:14:55 by frfrey       #+#   ##    ##    #+#        #
#    Updated: 2020/01/31 20:14:57 by frfrey      ###    #+. /#+    ###.fr      #
#                                                          /                   #
#                                                         /                    #
# **************************************************************************** #

#!/bin/sh

/etc/init.d/sshd restart
nginx -g "daemon off;"