class window.Deck extends Backbone.Collection

  model: Card

  initialize: ->
    @add _(_.range(0, 52)).shuffle().map (card) ->
      new Card
        rank: card % 13
        suit: Math.floor(card / 13)

  dealPlayer: ->
    console.log "player dealt"
    hand = new Hand [ @pop(), @pop() ], @
  dealDealer: ->
    console.log "dealer dealt"
    new Hand [ @pop().flip(), @pop() ], @, true