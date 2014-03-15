class window.HandView extends Backbone.View

  className: 'hand'

  #todo: switch to mustache
  template: _.template '<h2><% if(isDealer){ %>Dealer<% }else{ %>You<% } %> (<span class="score"></span>)</h2>'

  initialize: ->
    @collection.on 'add remove change', =>
      @render()
    @collection.on 'reDeal', => #move to app view
      console.log "redeal heard."
      @render()

      # if @collection.scores()[0] > 21 then @collection.bust()
    # @collection.on 'change', =>
    #   console.log @collection
    #   @render()
    #   if @collection.scores()[0] > 21 then @collection.bust()
    # @collection.on 'stand', =>
    #   console.log @get('playerHand').scores()
    @render()

  render: ->
    @$el.children().detach()
    @$el.html @template @collection
    @$el.append @collection.map (card) ->
      new CardView(model: card).$el
    @$('.score').text @collection.scores()[0]