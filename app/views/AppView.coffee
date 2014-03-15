class window.AppView extends Backbone.View

  template: _.template '
    <button class="hit-button">Hit</button> <button class="stand-button">Stand</button>
    <div class="player-hand-container"></div>
    <div class="dealer-hand-container"></div>
  '

  events:
    "click .hit-button": -> @model.get('playerHand').hit()
    "click .stand-button": -> @model.get('dealerHand').stand() #link to hand

  initialize: ->
    @render()
    @model.get('dealerHand').on 'stand', =>
      @model.get('dealerHand').models[0].flip()
      while @model.get('dealerHand').scores()[0] < 17
        @model.get('dealerHand').hit()
      if @model.get('dealerHand').scores()[0] > 21
        @model.get('dealerHand').bust()

      else if @model.get('dealerHand').scores()[0] < @model.get('playerHand').scores()[0]
        @model.get('dealerHand').bust()
      else
        @model.get('playerHand').bust()
    @model.get('playerHand').on 'hit', =>
      if @model.get('playerHand').scores()[0] > 21
        @model.get('playerHand').bust()
    @model.get('playerHand').on 'bust', =>
      console.log "BUST HAS BEEN HEARD!"
      @model.reDeal()
      console.log @
      # @render()
    @model.get('dealerHand').on 'bust', =>
      @model.reDeal()
      # @render()
      # @model.get('playerHand').clearCards()
      # @model.get('dealerHand').clearCards()


  render: ->
    @$el.children().detach()
    @$el.html @template()
    @$('.player-hand-container').html new HandView(collection: @model.get 'playerHand').el
    @$('.dealer-hand-container').html new HandView(collection: @model.get 'dealerHand').el
