.PHONY: c- coveralls mocha

c- c-%:
	rm -rf spec
	coffee -c$*o . source

coveralls:
	istanbul cover ./node_modules/mocha/bin/_mocha spec/main.js --report lcovonly -- -R spec && cat ./coverage/lcov.info | ./node_modules/coveralls/bin/coveralls.js && rm -rf ./coverage

mocha:
	./node_modules/.bin/mocha \
		--no-exit \
		spec/main.js \
		--check-leaks
