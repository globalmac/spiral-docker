C ?= spiral.test

install:
	docker-compose run --rm -w /app $(C) bash -c "composer create-project spiral/app backend && cd backend && chmod +x rr"  && docker-compose down

serve:
	docker-compose run --rm --service-ports -w /app/backend $(C) bash -c "./rr serve" && docker-compose down

cmd:
	docker-compose run --rm -w /app/backend $(C) bash && docker-compose down
