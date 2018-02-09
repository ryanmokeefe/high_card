# Use these two arrays to generate a deck of cards.
# ranks = ["A", 2, 3, 4, 5, 6, 7, 8, 9, 10, "J", "Q", "K" ]
ranks = ["A", 10, "J", "Q", "K"]

suits = [ "hearts", "spades", "clubs", "diamonds"]


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
$winner = []

high_score = players.select { |player| player[:hand][0] == "A" || player[:hand][0] == "K" || player[:hand][0] == "Q" || player[:hand][0] == "J" || player[:hand][0] == 10  }
$winner << high_score

    # high_score = players.select { |player| player[:hand][0] == "A" }
    # $winner << high_score
    # if $winner.length == 0
    #     high_score = players.select { |player| player[:hand][0] == "K" }
    #     $winner << high_score
    # end 
    # if $winner.length == 0
    #     high_score = players.select { |player| player[:hand][0] == "Q" }
    #     $winner << high_score
    # end 
    # if $winner.length == 0
    #     high_score = players.select { |player| player[:hand][0] == "J" }
    #     $winner << high_score
    # end 
    # if $winner.length == 0
    #     high_score = players.select { |player| player[:hand][0] == 10 }
    #     $winner << high_score
    # end 
    # if $winner.length == 0
    #     ranking = players.sort_by! { |player| player[:hand][0] }
    #     high_score = ranking[-1]
    #     $winner << high_score 
    # end
       


ranking = players.sort_by! { |player| player[:hand] }








puts "Ranked:"
puts ranking
puts "Winner(s): "
puts $winner

# puts "Rankings: "
# score = players.sort_by! { |each| each["hand"] }
# puts score

##### not sorting, not pushing winners
