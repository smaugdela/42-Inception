


#	Variables	#

NAME = Inception

SRCS = ./srcs/requirements/

SERVICES = nginx \
	   mariadb \
	   wordpress

COMPOSE = ./srcs/docker-compose.yml

SERVICE_DIR = ${addprefix ${./srcs/requirements/},${SERVICES}/Dockerfile}



#	Rules	#

all:	${SERVICE_DIR} build

${NAME}:	all

up:	all

down:

build:	${SERVICE_DIR}
	docker build -t ${SERVICES} $</Dockerfile

clean:

fclean:

re:

.PHONY: all, up, down, clean, fclean, re

