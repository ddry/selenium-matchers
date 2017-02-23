.PHONY: c- coveralls mocha

c- c-%:
	make server-$*
	coffee -c$*o . source

server- server-%:
	rm -rf spec
	@if [ "$*" = "w" ]; then \
		sh usecase/sh/server; \
	fi

ps:
	sh usecase/sh/ps_cleanup

coveralls:
	istanbul cover ./node_modules/mocha/bin/_mocha spec/main.js --report lcovonly -- -R spec && cat ./coverage/lcov.info | ./node_modules/coveralls/bin/coveralls.js && rm -rf ./coverage

mocha:
	./node_modules/.bin/mocha \
		--no-exit \
		spec/main.js \
		--check-leaks
