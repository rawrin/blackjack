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
      # if @model.get('dealerHand').scores()[0] > 21
      #   @model.get('dealerHand').bust()
      while @model.get('dealerHand').scores()[0] < 17
        @model.get('dealerHand').hit()
      if @model.get('dealerHand').scores()[0] > 21
        @model.get('dealerHand').bust()

      else if @model.get('dealerHand').scores()[0] < @model.get('playerHand').scores()[0]
        @model.get('dealerHand').bust()
      else
        @model.get('playerHand').bust()
      @render()

  render: ->
    @$el.children().detach()
    @$el.html @template()
    @$('.player-hand-container').html new HandView(collection: @model.get 'playerHand').el
    @$('.dealer-hand-container').html new HandView(collection: @model.get 'dealerHand').el
