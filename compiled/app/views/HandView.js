// Generated by CoffeeScript 1.6.2
(function() {
  var _ref,
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  window.HandView = (function(_super) {
    __extends(HandView, _super);

    function HandView() {
      _ref = HandView.__super__.constructor.apply(this, arguments);
      return _ref;
    }

    HandView.prototype.className = 'hand';

    HandView.prototype.template = _.template('<h2><% if(isDealer){ %>Dealer<% }else{ %>You<% } %> (<span class="score"></span>)</h2>');

    HandView.prototype.initialize = function() {
      var _this = this;

      this.collection.on('add remove', function() {
        _this.render();
        if (_this.collection.scores()[0] > 21) {
          return _this.collection.bust();
        }
      });
      this.collection.on('change', function() {
        _this.render();
        if (_this.collection.scores()[0] > 21) {
          return _this.collection.bust();
        }
      });
      return this.render();
    };

    HandView.prototype.render = function() {
      this.$el.children().detach();
      this.$el.html(this.template(this.collection));
      this.$el.append(this.collection.map(function(card) {
        return new CardView({
          model: card
        }).$el;
      }));
      return this.$('.score').text(this.collection.scores()[0]);
      /*
      if !@collection.isDealer
        playerScore = @collection.scores()[0]
        if playerScore == 21 then alert "YOU ARE A WINNER."
        if playerScore > 21 then alert "GO HOME AND DIE."
      if @collection.isDealer
        dealerScore = @collection.scores()[0]
        if dealerScore == 21 or dealerScore > playerScore
          alert "DEALER WINS, KILL YOURSELF."
        else alert "YOU ARE WINNER!!!!!!!!"
      */

    };

    return HandView;

  })(Backbone.View);

}).call(this);

/*
//@ sourceMappingURL=HandView.map
*/