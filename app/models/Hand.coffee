class window.Hand extends Backbone.Collection

  model: Card

  initialize: (array, @deck, @isDealer) ->

  hit: ->
    @add(@deck.pop()).last()
    @trigger 'hit', @

  stand: ->
    # @models[0].flip()
    # while @scores()[0] < 17
    #   do @hit
    @trigger 'stand', @

  scores: ->
    # The scores are an array of potential scores.
    # Usually, that array contains one element. That is the only score.
    # when there is an ace, it offers you two scores - the original score, and score + 10.
    hasAce = @reduce (memo, card) ->
      memo or card.get('value') is 1
    , false
    score = @reduce (score, card) ->
      score + if card.get 'revealed' then card.get 'value' else 0
    , 0
    if hasAce then [score, score + 10] else [score]

  bust: ->
    if @isDealer
      alert "you win!!!!"
    if !@isDealer
      alert "you lose, try again!!!!"
    console.log "bust triggered"
    @trigger 'bust', @

  clearCards: ->
    # console.log @
    # @models = []
    # if @isDealer
    #   (@deck.pop().flip)
    #   @hit()
    # if !@isDealer
    #   @hit()
    #   @hit()
    # console.log @
    @trigger 'clearCards', @