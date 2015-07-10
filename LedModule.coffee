_ = require('lodash')
j5 = require('johnny-five')

module.exports = class LedModule
  constructor: (params...) ->
    @ledIdx = 0
    @ledList = []
    _.each(params, (ledPin) =>
      @ledList.push(new j5.Led(ledPin))
    )

  onLight: () ->
    @ledList[@ledIdx].on()
    if @ledIdx < @ledList.length - 1
      @ledIdx++

  offLight: () ->
    @ledList[@ledIdx].off()
    if @ledIdx > 0
      @ledIdx--