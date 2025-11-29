
build_dev:
	docker compose -f compose.dev.yaml build

dev: build_dev
	docker compose -f compose.dev.yaml up -d

stop_dev:
	docker compose -f compose.dev.yaml down

# build:
# 	docker compose build

# run:
# 	docker compose up --build -d
