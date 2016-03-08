AutocompleteReactView = require './autocomplete-react-view'
{CompositeDisposable} = require 'atom'

module.exports = AutocompleteReact =
  autocompleteReactView: null
  modalPanel: null
  subscriptions: null

  activate: (state) ->
    @autocompleteReactView = new AutocompleteReactView(state.autocompleteReactViewState)
    @modalPanel = atom.workspace.addModalPanel(item: @autocompleteReactView.getElement(), visible: false)

    # Events subscribed to in atom's system can be easily cleaned up with a CompositeDisposable
    @subscriptions = new CompositeDisposable

    # Register command that toggles this view
    @subscriptions.add atom.commands.add 'atom-workspace', 'autocomplete-react:toggle': => @toggle()

  deactivate: ->
    @modalPanel.destroy()
    @subscriptions.dispose()
    @autocompleteReactView.destroy()

  serialize: ->
    autocompleteReactViewState: @autocompleteReactView.serialize()

  toggle: ->
    console.log 'AutocompleteReact was toggled!'

    if @modalPanel.isVisible()
      @modalPanel.hide()
    else
      @modalPanel.show()
