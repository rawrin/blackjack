// Generated by CoffeeScript 1.6.2
(function() {
  var _ref,
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  window.Hand = (function(_super) {
    __extends(Hand, _super);

    function Hand() {
      _ref = Hand.__super__.constructor.apply(this, arguments);
      return _ref;
    }

    Hand.prototype.model = Card;

    Hand.prototype.initialize = function(array, deck, isDealer) {
      this.deck = deck;
      this.isDealer = isDealer;
    };

    Hand.prototype.hit = function() {
      this.add(this.deck.pop()).last();
      return this.trigger('hit', this);
    };

    Hand.prototype.stand = function() {
      return this.trigger('stand', this);
    };

    Hand.prototype.scores = function() {
      var hasAce, score;

      hasAce = this.reduce(function(memo, card) {
        return memo || card.get('value') === 1;
      }, false);
      score = this.reduce(function(score, card) {
        return score + (card.get('revealed') ? card.get('value') : 0);
      }, 0);
      if (hasAce) {
        return [score, score + 10];
      } else {
        return [score];
      }
    };

    Hand.prototype.bust = function() {
      if (this.isDealer) {
        alert("you win!!!!");
      }
      if (!this.isDealer) {
        alert("you lose, try again!!!!");
      }
      console.log("bust triggered");
      return this.trigger('bust', this);
    };

    Hand.prototype.clearCards = function() {
      return this.trigger('clearCards', this);
    };

    return Hand;

  })(Backbone.Collection);

}).call(this);

/*
//@ sourceMappingURL=Hand.map
*/
