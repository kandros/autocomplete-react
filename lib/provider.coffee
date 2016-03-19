module.exports =
  # This will work on JavaScript and CoffeeScript files, but not in js comments.
  selector: '.meta.class.body.js'

  isReactClass: (editor) ->
    classes = atom.views.getView(editor)
      .shadowRoot
      .querySelectorAll('.class.type')

    [].slice.call(classes).some((item) -> item.closest('.line').textContent.includes('Component'))

  getSuggestions: ({ editor }) ->
    if @isReactClass(editor)
      console.log 'weeee'
      new Promise (resolve) ->
        # Find your suggestions here
        suggestions = [
          {
            snippet: """
              componentWillMound() {
                $1
              }
            """, # OR
            displayText: 'componentWillMount', # (optional)
            type: 'function', # (optional)
            descriptionMoreURL: 'https://facebook.github.io/react/docs/component-specs.html#mounting-componentwillmount'
            leftLabel: '', # (optional)
            # replacementPrefix: 'so', # (optional)
            leftLabelHTML: '', # (optional)
            rightLabel: 'React', # (optional)
            # rightLabelHTML: 'testHtml', # (optional)
            # className: '', # (optional)
            description: 'Invoked once, both on the client and server, immediately before the initial rendering occurs. If you call setState within this method, render() will see the updated state and will be executed only once despite the state change.', # (optional)
            # descriptionMoreURL: '', # (optional)
          },
          {
            snippet: """
              componentWillReceiveProps(nextProps) {
                $1
              }
            """, # OR
            displayText: 'componentWillReceiveProps(nextProps)', # (optional)
            type: 'function', # (optional)
            descriptionMoreURL: 'https://facebook.github.io/react/docs/component-specs.html#mounting-componentwillmount'
            leftLabel: '', # (optional)
            # replacementPrefix: 'so', # (optional)
            leftLabelHTML: '', # (optional)
            rightLabel: 'React', # (optional)
            # rightLabelHTML: 'testHtml', # (optional)
            # className: '', # (optional)
            # iconHTML: '<i class="icon-move-right"></i>', # (optional)
            description: 'Invoked when a component is receiving new props. This method is not called for the initial render.
            Use this as an opportunity to react to a prop transition before render() is called by updating the state using this.setState(). The old props can be accessed via this.props. Calling this.setState() within this function will not trigger an additional render.', # (optional)
            descriptionMoreURL: 'https://facebook.github.io/react/docs/component-specs.html#updating-componentwillreceiveprops', # (optional)
          },
          {
            snippet: """
              shouldComponentUpdate(nextProps, nextState) {
                $1
              }
            """, # OR
            displayText: 'shouldComponentUpdate(nextProps, nextState) : boolean', # (optional)
            type: 'function', # (optional)
            descriptionMoreURL: 'https://facebook.github.io/react/docs/component-specs.html#mounting-componentwillmount'
            leftLabel: '', # (optional)
            # replacementPrefix: 'so', # (optional)
            leftLabelHTML: '', # (optional)
            rightLabel: 'React', # (optional)
            # rightLabelHTML: 'testHtml', # (optional)
            # className: '', # (optional)
            # iconHTML: '<i class="icon-move-right"></i>', # (optional)
            description: 'Invoked before rendering when new props or state are being received. This method is not called for the initial render or when forceUpdate is used.', # (optional)
            descriptionMoreURL: 'https://facebook.github.io/react/docs/component-specs.html#updating-shouldcomponentupdate', # (optional)
          }
        ]

        resolve(suggestions)
