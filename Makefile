# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: smagdela <smagdela@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/12/13 13:28:22 by smagdela          #+#    #+#              #
#    Updated: 2023/01/10 17:39:14 by smagdela         ###   ########.fr        #
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

#############
#	Rules	#
#############

all:	${VOLUMES}
	docker compose --project-directory ${COMPOSE_DIR} -p ${NAME} up -d

${NAME}:	all

up:	all

${VOLUMES}:
	mkdir -p $@

start:
	docker compose -p ${NAME} start

stop:
	docker compose -p ${NAME} stop

logs:
	@echo "\033[0;32mnginx:\n"
	@docker logs nginx -t --tail 10
	@echo "-----\033[0;33m\nwordpress:\n"
	@docker logs wordpress -t --tail 10
	@echo "-----\033[0;34m\nmariadb:\n"
	@docker logs mariadb -t --tail 10
	@echo "\033[0m"

clean:	stop
	docker container rm -f ${SERVICES}

fclean:	clean
	docker image rm -f ${addprefix ${NAME}-,${SERVICES}}
	docker volume rm -f ${NAME}_mariadb_data
	docker volume rm -f ${NAME}_wordpress_data
	sudo rm -rf ${VOLUMES}

re:	fclean all

.PHONY: all, up, start, stop, clean, fclean, re
