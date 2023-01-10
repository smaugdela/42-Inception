# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: smagdela <smagdela@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/12/13 13:28:22 by smagdela          #+#    #+#              #
#    Updated: 2023/01/10 14:09:17 by smagdela         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#################
#	Variables	#
#################

NAME = inception

#	Directories
SRCS = ./srcs/

REQ	=	${SRCS}requirements/

VOLUMES	=	wordpress \
			mariadb
VOLUMES	:=	${addprefix ~/data/,${VOLUMES}}

COMPOSE_DIR = ${SRCS}

#	Files
SERVICES = nginx \
	   mariadb \
	   wordpress

SERV_DOCKERFILES = ${addprefix ${REQ},${SERVICES}/Dockerfile}

#############
#	Rules	#
#############

all:	${VOLUMES} ${SERVICES}
	docker compose --project-directory ${COMPOSE_DIR} -p ${NAME} up -d

${NAME}:	all

up:	all

${VOLUMES}:
	mkdir -p $@

${SERVICES}:	${SERV_DOCKERFILES}
	docker build -t $@ $<

stop:
	docker compose -p ${NAME} stop

clean:	stop
	docker container rm -f nginx mariadb wordpress
	docker image rm -f ${addprefix ${NAME}-,${SERVICES}} ${SERVICES}

fclean:	clean
	docker volume rm -f ${NAME}_mariadb_data
	docker volume rm -f ${NAME}_wordpress_data
	sudo rm -rf ${VOLUMES}

re:	fclean all

.PHONY: all, up, down, clean, fclean, re
