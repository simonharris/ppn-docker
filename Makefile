
build_dev:
	docker compose -f compose.dev.yaml build

run_dev: build_dev
	docker compose -f compose.dev.yaml up -d

down_dev:
	docker compose -f compose.dev.yaml down

clean_dev:
	rm -rf site/node_modules package-lock.json
	docker compose -f compose.dev.yaml build site
	docker compose -f compose.dev.yaml run --rm site npm install

build:
	docker compose -f compose.yaml build

run: build
	docker compose -f compose.yaml up -d

down:
	docker compose -f compose.yaml down
