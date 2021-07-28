NET =	inception

all: mkdir up

psls:
	clear
	docker images
	@echo "======================================"
	docker network ls
	@echo "======================================"
	docker volume ls
	@echo "======================================"
	docker ps -a

mkdir:
	@echo "=Make dirictory data=================="
	mkdir -p ~/data/db
	mkdir -p ~/data/wp
	mkdir -p ~/data/ad
	mkdir -p ~/data/html
	mkdir -p ~/data/rd
	mkdir -p ~/data/ftp
	mkdir -p ~/data/dns

up:
	@echo "======================================"
	docker-compose -f ./srcs/docker-compose.yml up -d --build
	@echo "======================================"
	docker images
	@echo "======================================"
	docker network ls
	@echo "======================================"
	docker volume ls
	@echo "======================================"
	docker ps -a

stop:
	@echo "=Stopping containers's stack=========="
	docker-compose -f ./srcs/docker-compose.yml stop
	@echo "======================================"
	docker ps -a

rm:
	@echo "=Removing containers=================="
	docker rm -f $$(docker ps -aq)

rmi:
	@echo "=Removing images======================"
	docker rmi -f $$(docker images -q)

net:
	@echo "=Removing network====================="
	docker network rm $(NET)

vol:
	@echo "=Removing volumes====================="
	docker volume rm $$(docker volume ls -q)

vold:
	@echo "=Removing directory data=============="
	sudo rm -fr ~/data
	
rst:
	@echo "=Restarting docker===================="
	sudo systemctl restart docker
logs:
	docker-compose -f ./srcs/docker-compose.yml logs -f

netshoot:
	@echo "=Netshoot by Nicolaka================="
	docker run --rm -it --network $(NET) nicolaka/netshoot
	
clean: rm net vol rst psls

fclean: clean rmi vold psls

.PHONY: all psls up stop rm rmi net vol rst logs netshoot clean fclean mkdir


