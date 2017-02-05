'use strict'

chai = require 'chai'
chai.use require 'chai-as-promised'
expect = chai.expect

module.exports =
  selenium_text_by_selector: (code, i, e) ->
    text = code.use.findElement(css: i).getText()
    expect(text).to.eventually.equal e

  selenium_text: (code, i, e) ->
    text = code.use.findElement(i).getText()
    expect(text).to.eventually.equal e
