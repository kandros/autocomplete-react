
provider = require './provider'
{CompositeDisposable} = require 'atom'

module.exports = test =
  subscriptions: null

  activate: ->
    @subscriptions = new CompositeDisposable

  deactivate: ->
    @subscriptions.dispose()

  getProvider: ->
    provider
