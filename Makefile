
SRC = $(shell find lib -name "*.js" -type f)
UGLIFY_FLAGS = --no-mangle 

all: sdejs.min.js

test:
	@./node_modules/.bin/mocha \
		--reporter spec

sdejs.js: $(SRC)
	@node support/compile.js $^

sdejs.min.js: ejs.js
	@uglifyjs $(UGLIFY_FLAGS) $< > $@ \
		&& du sdejs.min.js \
		&& du sdejs.js

clean:
	rm -f sdejs.js
	rm -f sdejs.min.js

.PHONY: test