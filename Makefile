#!ash  # Explicitly specify ash shell

PARENT_DIR := /root/jenkins-docker/
CHILD_DIR := /root/jenkins-docker/docker/

## start: Start jenkins container
start:
	clear && . $(PARENT_DIR)ascii.sh "Jenkins"; \
	cd $(CHILD_DIR); \
	chmod 666 /var/run/docker.sock; \
	docker-compose pull && docker compose up -d; \
	cd $(PARENT_DIR) || exit 1

## restart: Restart jenkins container
restart:
	clear && . $(PARENT_DIR)ascii.sh "Jenkins"; \
	cd $(CHILD_DIR); \
	chmod 666 /var/run/docker.sock; \
	docker-compose down && docker compose up -d; \
	cd $(PARENT_DIR) || exit 1

## stop: Stop jenkins container
stop:
	clear && . $(PARENT_DIR)ascii.sh "Jenkins"; \
	cd $(CHILD_DIR); \
	docker-compose stop; \
	cd $(PARENT_DIR) || exit 1

## create-dirs: Create jenkins required data folders
create-dirs:
	clear && . $(PARENT_DIR)ascii.sh "Jenkins"; \
	cd $(CHILD_DIR); \
	rm -rf /root/jenkins; \
	mkdir /root/jenkins; \
	mkdir /root/jenkins/home; \
	chmod -R 777 /root/jenkins; \
	echo; \
	echo "All Done!"; \
	ls -al /root/jenkins; \
	cd $(PARENT_DIR) || exit 1

## logs: Tail jenkins container logs
logs:
	clear && . $(PARENT_DIR)ascii.sh "Jenkins"; \
	cd $(CHILD_DIR); \
	docker-compose logs -f; \
	cd $(PARENT_DIR) || exit 1

## show: Show jenkins containers
show:
	clear && . $(PARENT_DIR)ascii.sh "Jenkins"; \
	cd $(CHILD_DIR); \
	docker-compose ps; \
	cd $(PARENT_DIR) || exit 1

## clean: Clean jenkins containers and volumes (using implicit rule)
.PHONY: clean
clean:
	clear && . $(PARENT_DIR)ascii.sh "Jenkins"; \
	cd $(CHILD_DIR); \
	docker system prune -f; \
	docker volume prune -f; \
	cd $(PARENT_DIR) || exit 1

## help: Command to view help
help: Makefile
	clear && . $(PARENT_DIR)ascii.sh "Jenkins"
	@echo
	@echo "Choose a command (Alpine Linux ONLY):"
	@echo
	@echo "  start           : Start jenkins container"
	@echo "  restart         : Restart jenkins container"
	@echo "  stop            : Stop jenkins container"
	@echo "  logs            : Tail jenkins container logs"
	@echo "  show            : Show jenkins containers"
	@echo "  clean           : Clean jenkins containers and volumes"
	@echo "  create-dirs     : Create jenkins required data folders"
	@echo "  help            : Show this help message"
	@echo 
