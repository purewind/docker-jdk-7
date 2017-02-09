all: build

build:
	@docker build --tag=purewind/jdk7:latest .

release: build
	@docker build --tag=purewind/jdk7:$(shell cat VERSION) .