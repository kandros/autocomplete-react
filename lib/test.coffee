
provider = require './provider'
{CompositeDisposable} = require 'atom'

module.exports = test =
  subscriptions: null

  activate: ->
    console.log 'activated'
    @subscriptions = new CompositeDisposable
    @subscriptions.add atom.commands.add 'atom-workspace', 'test:toggle': => @toggle()

  deactivate: ->
    @subscriptions.dispose()

  toggle: ->
    console.log 'AutocompleteReact was toggled!'
    console.log provider

  getProvider: ->
    console.log 'provider requested'
    provider
