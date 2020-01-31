# **************************************************************************** #
#                                                           LE - /             #
#                                                               /              #
#    dockerfile                                       .::    .:/ .      .::    #
#                                                  +:+:+   +:    +:  +:+:+     #
#    By: frfrey <frfrey@student.le-101.fr>          +:+   +:    +:    +:+      #
#                                                  #+#   #+    #+    #+#       #
#    Created: 2020/01/31 13:39:57 by frfrey       #+#   ##    ##    #+#        #
#    Updated: 2020/01/31 16:40:01 by frfrey      ###    #+. /#+    ###.fr      #
#                                                          /                   #
#                                                         /                    #
# **************************************************************************** #

FROM  nginx:alpine

LABEL maintainer="Francois Frey <frfrey@student.le-101.fr>"

RUN apk update \
&& apk upgrade \
&& apk add \
	ca-certificates libssl1.1 \
	php \
	php-fpm \
	php-cli \
	php-curl \
	php-gd \
	php-mbstring \
	php-opcache \
&& apk --update add --no-cache openssh bash \
&& sed -i s/#PermitRootLogin.*/PermitRootLogin\ yes/ /etc/ssh/sshd_config \
&& echo "root:root" | chpasswd \
&& rm -rf /var/cache/apk/* \
&& apk update \
&& apk upgrade \
&& ssh-keygen -f /etc/ssh/ssh_host_rsa_key -N '' -t rsa

ADD ./nginx/default.conf /etc/nginx/conf.d/default.conf
ADD ./nginx/nginx-selfsigned.key /etc/ssl/private/nginx-selfsigned.key
ADD ./nginx/nginx-selfsigned.crt /etc/ssl/certs/nginx-selfsigned.crt
ADD ./nginx/dhparam.pem /etc/nginx/dhparam.pem
ADD ./nginx/self-signed.conf /etc/nginx/snippets/self-signed.conf
ADD ./nginx/ssl-params.conf /etc/nginx/snippets/ssl-params.conf
COPY ./nginx/StartupScript.sh .

RUN chmod +x StartupScript.sh

EXPOSE 80 443 22

CMD ["/bin/sh", "StartupScript.sh"]
