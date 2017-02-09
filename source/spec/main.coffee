'use strict'

spec = require('ddry/modular')()

spec.apply
  title: 'Selenium matchers testing with PhantomJS usecase'
  spec: 'spec'
  matchers: 'index'
  moduleTitles:
    phantomjs: 'Selenium PhantomJS usecase testing'
    instance: "PhantomJS driver as it is with 'instance' matcher"
  outside:
    phantomjs: 'ddry-selenium-phantomjs'
    instance: 'ddry-selenium-phantomjs'
  use: [ 'phantomjs' ]
  initial:
    instance: []
