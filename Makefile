# Makefile for building and testing TierraOS Release Creator

KEYWORD=CREATE_RELEASE

run: build
	docker run --rm tierra-release-creator $(KEYWORD)

build:
	docker build --tag tierra-release-creator .

test:
	./entrypoint.sh $(KEYWORD)
