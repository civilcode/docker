update_version:
	sed -i '' 's/FROM\ bitwalker\/alpine-elixir-phoenix:.*/FROM\ bitwalker\/alpine-elixir-phoenix:$(VERSION)/g' **/Dockerfile
	sed -i '' 's/FROM\ bitwalker\/alpine-elixir-phoenix:.*/FROM\ bitwalker\/alpine-elixir-phoenix:$(VERSION)/g' **/Dockerfile.*

dev: build_dev	push_dev

build_dev:
	docker build --no-cache -t civilcode/elixir-dev:$(VERSION) -f elixir/Dockerfile.dev .

push_dev:
	docker push civilcode/elixir-dev:$(VERSION)

ci: build_ci push_ci

build_ci:
	docker build --no-cache -t civilcode/elixir-ci:$(VERSION) -f elixir/Dockerfile.ci .

push_ci:
	docker push civilcode/elixir-ci:$(VERSION)
