install:
	bundle install

lint:
	rake rubocop

test:
	rake test

.PHONY: test
