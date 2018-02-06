# Use these two arrays to generate a deck of cards.
ranks = ["A", 2, 3, 4, 5, 6, 7, 8, 9, 10, "J", "Q", "K" ]
suits = [ "hearts", "spades", "clubs", "diamonds" ]

players = []

card_deck = []

# Create deck - add value and suit:
suits.each do |suit|
    ranks.map do |rank|
        card_deck.push([rank, suit])
    end
end
deck = card_deck.shuffle
# puts card_deck
# puts deck

# Get players:
input = ""
until input == "play"
    n = players.length
    puts "#{n} players so far. Enter a player name, or type 'play':"
    input = gets.chomp
    break if input == "play"
    players.push({name: input})
end 

# Deal:
i = 0
while i < players.length do
    players.each do |player|
        player[:hand] = deck[i]
        i +=1
    end
end

puts players

# find A, K, Q, J, 10: (add IF st. for a tie)
winner = []

while winner.length < 1 do
    high_score = players.detect { |player| player["hand"] == "A" }
    winner.push(high_score)
    break if winner.length > 0
    high_score = players.detect { |player| player["hand"] == "K" }    
    winner.push(high_score)
    break if winner.length > 0
    high_score = players.detect { |player| player["hand"] == "Q" }
    winner.push(high_score)
    break if winner.length > 0
    high_score = players.detect { |player| player["hand"] == "J" }
    winner.push(high_score)
    break if winner.length > 0
    high_score = players.detect { |player| player["hand"] == "10" }
    winner.push(high_score)
    break if winner.length > 0
    ranking = players.sort_by { |player| player["hand"] }
    high_score = ranking[-1]
    winner.push(high_score)    
end

puts "Winner(s): "
puts winner

puts "Rankings: "
score = players.sort_by { |player| player["hand"] }
puts score

##### not sorting, not pushing winners
