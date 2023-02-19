setup:
	@make build
	@make up 
	@make composer-update
build:
	docker-compose build --no-cache --force-rm
stop:
	docker-compose stop
up:
	docker-compose up -d
composer-update:
	docker exec laravel-docker bash -c "composer update && php artisan key:generate"
data:
	docker exec laravel-docker bash -c "php artisan migrate"
	docker exec laravel-docker bash -c "php artisan db:seed"
perm-storage:
	docker exec -t laravel-docker bash -c 'chown -R www-data:www-data /var/www/html/storage'
in:
	docker exec -it laravel-docker bash

