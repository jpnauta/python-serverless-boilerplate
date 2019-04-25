test:
	docker-compose -f docker-compose.test.yml build
	docker-compose -f docker-compose.test.yml up --force-recreate --abort-on-container-exit
test_structure:
	docker-compose build
	docker-compose -f docker-compose.structure.yml build
	docker-compose -f docker-compose.structure.yml up --abort-on-container-exit
start:
	docker-compose build
	docker-compose up
clean:
	docker-compose -f docker-compose.test.yml down
	docker-compose down
