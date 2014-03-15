class window.HandView extends Backbone.View

  className: 'hand'

  #todo: switch to mustache
  template: _.template '<h2><% if(isDealer){ %>Dealer<% }else{ %>You<% } %> (<span class="score"></span>)</h2>'

  initialize: ->
    @collection.on 'add remove', =>
      @render()
      if @collection.scores()[0] > 21 then @collection.bust()
    @collection.on 'change', =>
      @render()
      if @collection.scores()[0] > 21 then @collection.bust()

      # if !@collection.isDealer
      #   playerScore = @collection.scores()[0]
      #   if playerScore == 21 then alert "YOU ARE A WINNER."
      #   if playerScore > 21 then alert "GO HOME AND DIE."
      # if @collection.isDealer
      #   dealerScore = @collection.scores()[0]
      #   if dealerScore == 21 or dealerScore > playerScore
      #     alert "DEALER WINS, KILL YOURSELF."
      #   #else alert "YOU ARE WINNER!!!!!!!!"
    @render()

  render: ->
    @$el.children().detach()
    @$el.html @template @collection
    @$el.append @collection.map (card) ->
      new CardView(model: card).$el
    @$('.score').text @collection.scores()[0]
    ###
    if !@collection.isDealer
      playerScore = @collection.scores()[0]
      if playerScore == 21 then alert "YOU ARE A WINNER."
      if playerScore > 21 then alert "GO HOME AND DIE."
    if @collection.isDealer
      dealerScore = @collection.scores()[0]
      if dealerScore == 21 or dealerScore > playerScore
        alert "DEALER WINS, KILL YOURSELF."
      else alert "YOU ARE WINNER!!!!!!!!"###