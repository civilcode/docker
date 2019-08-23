upgrade: version.update dev ci changes.commit

version.update:
	find . -name "Dockerfile*" -exec sed -i '' 's/FROM\ bitwalker\/alpine-elixir-phoenix:.*/FROM\ bitwalker\/alpine-elixir-phoenix:$(VERSION)/g' {} \;

dev: dev.build dev.push

dev.build:
	docker build --no-cache -t civilcode/elixir-dev:$(VERSION)$(SUFFIX) -f Dockerfile.dev .

dev.push:
	docker push civilcode/elixir-dev:$(VERSION)$(SUFFIX)

ci: ci.build ci.push

ci.build:
	docker build --no-cache -t civilcode/elixir-ci:$(VERSION)$(SUFFIX) -f Dockerfile.ci .

ci.push:
	docker push civilcode/elixir-ci:$(VERSION)$(SUFFIX)

changes.commit:
	git add .
	git commit -m "Upgrade to elixir $(VERSION)$(SUFFIX)"
