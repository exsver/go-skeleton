GO_BIN ?= go
GOPATH := $(shell $(GO_BIN) env GOPATH)
OUT_BIN = main

export PATH := $(PATH):/usr/local/go/bin:$(GOPATH)/bin

all: clean build

build:
	$(GO_BIN) mod tidy
	$(GO_BIN) build -o $(OUT_BIN) -v

download:
	$(GO_BIN) get
	$(GO_BIN) mod tidy

update:
	$(GO_BIN) get -u
	$(GO_BIN) mod tidy

clean:
	$(GO_BIN) clean
	rm -f $(OUT_BIN)

lint:
    # Install:
    #   https://golangci-lint.run/docs/welcome/install/local/
    #   binary will be $(go env GOPATH)/bin/golangci-lint
    #   curl -sSfL https://raw.githubusercontent.com/golangci/golangci-lint/master/install.sh | sh -s -- -b $(go env GOPATH)/bin latest
    #   or
    #   go install github.com/golangci/golangci-lint/cmd/golangci-lint@latest
    # Check Version
    #   golangci-lint --version
	golangci-lint run ./...
