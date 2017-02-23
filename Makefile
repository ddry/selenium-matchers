.PHONY: c- coveralls mocha ps server-

c- c-%:
	make server-$*
	coffee -c$*o . source

coveralls:
	istanbul cover ./node_modules/mocha/bin/_mocha spec/main.js --report lcovonly -- -R spec && cat ./coverage/lcov.info | ./node_modules/coveralls/bin/coveralls.js && rm -rf ./coverage

mocha:
	./node_modules/.bin/mocha \
		--no-exit \
		spec/main.js \
		--check-leaks

ps:
	sh usecase/sh/ps_cleanup

server- server-%:
	rm -rf spec
	@if [ "$*" = "w" ]; then \
		sh usecase/sh/server; \
	fi
