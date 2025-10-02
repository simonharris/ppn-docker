
dev:
	npm run dev -- --host 0.0.0.0

fix:
	rm -rf node_modules/
	rm package-lock.json
	npm install

build:
	docker build -t my-vue-site .

run: build
	docker run -p 5173:5173 my-vue-site
