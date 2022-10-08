install:
	bundle install

lint:
	bundle exec rake rubocop

test:
	bunle exec rake test

.PHONY: test
