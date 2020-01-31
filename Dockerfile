# **************************************************************************** #
#                                                           LE - /             #
#                                                               /              #
#    Dockerfile                                       .::    .:/ .      .::    #
#                                                  +:+:+   +:    +:  +:+:+     #
#    By: frfrey <frfrey@student.le-101.fr>          +:+   +:    +:    +:+      #
#                                                  #+#   #+    #+    #+#       #
#    Created: 2020/01/31 13:39:57 by frfrey       #+#   ##    ##    #+#        #
#    Updated: 2020/01/31 20:15:12 by frfrey      ###    #+. /#+    ###.fr      #
#                                                          /                   #
#                                                         /                    #
# **************************************************************************** #

FROM  nginx:stable-alpine

LABEL maintainer="Francois Frey <frfrey@student.le-101.fr>"

RUN apk update \
&& apk upgrade \
&& apk add \
	openssh openrc	\
&& openrc \
&& touch /run/openrc/softlevel

ADD	 srcs/sshd_config /etc/ssh/sshd_config
COPY srcs/StartupScript.sh .

RUN chmod +x StartupScript.sh

EXPOSE 80 22

CMD ["/bin/sh", "StartupScript.sh"]
