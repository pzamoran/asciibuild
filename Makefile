RUN ?= true
OPTS ?=

SRC = $(shell find lib -name *.rb -print) bin/asciibuild

.PHONY: all clean install test

clean:
	rm -Rf *.gem
	gem uninstall -x asciibuild

install: clean asciibuild.gemspec $(SRC)
	bundle install -V

test: install
	bundle exec asciibuild -a run=$(RUN) -a greeting $(OPTS) test/test-stage.adoc

all: install