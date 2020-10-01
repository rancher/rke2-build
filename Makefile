MODULE := $(shell basename $$PWD)

.PHONY: build destroy clean


build:
	@scripts/build build NAME=${NAME}

destroy:
	@scripts/build destroy NAME=${NAME}

clean:
	@scripts/build clean NAME=${NAME}

test:
	@scripts/test test_load NAME=${NAME}
