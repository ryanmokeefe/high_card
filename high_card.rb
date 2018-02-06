# Use these two arrays to generate a deck of cards.
ranks = ["A", 2, 3, 4, 5, 6, 7, 8, 9, 10, "J", "Q", "K" ]
suits = [ "hearts", "spades", "clubs", "diamonds" ]

players = []

# create deck:
card_deck = []
# create card - add value and suit
suits.each do |suit|
    ranks.map do |rank|
        card = {value: rank, suit: suit}
        card_deck.push(card)
    end
end




puts card_deck
