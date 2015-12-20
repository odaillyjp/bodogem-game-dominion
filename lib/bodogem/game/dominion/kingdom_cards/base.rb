define_card do
  en_name 'Market'
  ja_name '市場'
  type :action
  cost 5
  text <<-TEXT
    +1 Card
    +1 Action
    +1 Buy
    +1 Coin
  TEXT

  action do |player|
    player.give_card(1)
    player.give_action(1)
    player.give_buy(1)
    player.give_coin(1)
  end
end

define_card do
  en_name 'Remodel'
  ja_name '改築'
  type :action
  cost 4
  text <<-TEXT
    Trash a card from your hand.
    Gain a card costing up to 2 Coins more than the trashed card.
  TEXT

  action do |player|
    card = player.trash_card(from: :hand)
    player.gain_card(cost: card.cost + 2) if card.trashed?
  end
end

define_card do
  en_name 'Smithy'
  ja_name '鍛冶屋'
  type :action
  cost 4
  text <<-TEXT
    +3 Cards
  TEXT

  action do |player|
    player.give_card(3)
  end
end

define_card do
  en_name 'Money lender'
  ja_name '金貸し'
  type :action
  cost 4
  text <<-TEXT
    Trash a Copper card from your hand.
    If you do, +3 Coins.
  TEXT

  action do |player|
    card = player.trash_card(from: :hand, card_name: 'Copper')
    player.give_coin(3) if card.trashed?
  end
end

define_card do
  en_name 'Woodcutter'
  ja_name '木こり'
  type :action
  cost 3
  text <<-TEXT
    +1 Buy
    +2 Coins
  TEXT

  action do |player|
    player.give_buy(1)
    player.give_coin(2)
  end
end

define_card do
  en_name 'Council Room'
  ja_name '議事堂'
  type :action
  cost 5
  text <<-TEXT
    +4 Cards
    +1 Buy
    Each other player draws a card.
  TEXT

  action do |player|
    player.give_card(4)
    # TODO: other_players.each { |player| give_card(1) }
  end
end

define_card do
  en_name 'ThroneRoom'
  ja_name '玉座の間'
  type :action
  cost 4
  text <<-TEXT
    Choose an Action card in your hand.
    Play it twice.
  TEXT

  action do |player|
    # TODO: 実装
  end
end

define_card do
  en_name 'Laboratory'
  ja_name '研究所'
  type :action
  cost 5
  text <<-TEXT
    +2 Cards
    +1 Action
  TEXT

  action do |player|
    player.give_card(2)
    player.give_action(1)
  end
end

define_card do
  en_name 'Mine'
  ja_name '鉱山'
  type :action
  cost 5
  text <<-TEXT
    Trash a Treasure card from your hand.
    Gain a Treasure card costing up to 3 Coins more; put it into your hand.
  TEXT

  action do |player|
    card = player.trash_card(from: :hand, card_type: :tresure)
    player.gain_card(cost: card.cost + 3, card_type: :tresure, into: :hand) if card.trashed?
  end
end

define_card do
  en_name 'Workshop'
  ja_name '工房'
  type :action
  cost 3
  text <<-TEXT
    Gain a card costing up to 4 Coins.
  TEXT

  action do |player|
    player.gain_card(cost: 4)
  end
end

define_card do
  en_name 'Chancellor'
  ja_name '宰相'
  type :action
  cost 3
  text <<-TEXT
    +2 Coins
    You may immediately put your deck into your discard pile.
  TEXT

  action do |player|
    player.give_coin(2)
    player.discard_all_cards(from: :deck)
  end
end

define_card do
  en_name 'Feast'
  ja_name '祝宴'
  type :action
  cost 4
  text <<-TEXT
    Trash this card.
    Gain a card costing up to 5 Coins.
  TEXT

  action do |player|
    card = player.trash_card(from: :this)
    player.gain_card(cost: 5) if card.trashed?
  end
end

define_card do
  en_name 'Festival'
  ja_name '祝祭'
  type :action
  cost 5
  text <<-TEXT
    +2 Actions
    +1 Buy
    +2 Coins
  TEXT

  action do |player|
    player.give_action(2)
    player.give_buy(1)
    player.give_coin(2)
  end
end

define_card do
  en_name 'Library'
  ja_name '図書館'
  type :action
  cost 5
  text <<-TEXT
    Draw until you have 7 cards in hand.
    You may set aside any Action cards drawn this way, as you draw them; discard the set aside cards after you finish drawing.
  TEXT

  action do |player|
    # TODO: 実装
  end
end

define_card do
  en_name 'Cellar'
  ja_name '地下貯蔵庫'
  type :action
  cost 2
  text <<-TEXT
    +1 Action
    Discard any number of cards. +1 Card per card discarded.
  TEXT

  action do |player|
    player.give_action(1)
    cards = player.discard_card(from: :hand, any: true)
    player.give_card(cards.size) if cards.size > 0
  end
end

define_card do
  en_name 'Adventurer'
  ja_name '冒険者'
  type :action
  cost 6
  text <<-TEXT
    Reveal cards from your deck until you reveal 2 Treasure cards.
    Put those Treasure cards in your hand and discard the other revealed cards.
  TEXT

  action do |player|
    # TODO: 実装
  end
end

define_card do
  en_name 'Moat'
  ja_name '堀'
  type :action
  cost 2
  text <<-TEXT
    +2 Cards
    When another player plays an Attack card, you may reveal this from your hand.
    If you do, you are unaffected by that Attack.
  TEXT

  action do |player|
    player.give_card(2)
    # TODO: Reaction
  end
end

define_card do
  en_name 'Witch'
  ja_name '魔女'
  type :action
  cost 5
  text <<-TEXT
    +2 Cards
    Each other player gains a Curse card.
  TEXT

  action do |player|
    player.give_card(2)
    # TODO: Attack
  end
end

define_card do
  en_name 'Village'
  ja_name '村'
  type :action
  cost 3
  text <<-TEXT
    +1 Card
    +2 Actions
  TEXT

  action do |player|
    player.give_card(1)
    player.give_action(2)
  end
end

define_card do
  en_name 'Chapel'
  ja_name '修道院'
  type :action
  cost 2
  text <<-TEXT
    Trash up to 4 cards from your hand.
  TEXT

  action do |player|
    player.trash_card(from: :hand, num: 4)
  end
end
