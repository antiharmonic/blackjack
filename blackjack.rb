require_relative './hand.rb'
require_relative './western_card.rb'
require_relative './western_deck.rb'

trap("SIGINT") { exit! }

BLACKJACK = 21
DEALER_HIT = 16

userhand = Hand.new
dealerhand = Hand.new

deck = WesternDeck.new

def card_total(hand)
  ace = hand.ace_in_hand?
  acecount = 0
  total = 0
  hand.to_a.each do |card|
    
    if (card.to_i == 1)
      acecount += 1
      #puts "(acecount: #{acecount})"
      next
    end
    if card.to_i > 10
      total += 10
    else
      total += card.to_i
    end
  end
  
  acecount.times do |i|
    if (total >= 11) #need to add multiple aces into logic
      total += 1
    else
      total += 11
    end
  end
  total
end

def check_answer(ans)
  return true if ans =~ /y.*/i
  return false
end

begin #blackjack loop
  # deal to the user and dealer
  userhand.give(deck.deal)
  dealerhand.give(deck.deal)
  userhand.give(deck.deal)
  dealerhand.give(deck.deal)

  print "You have #{userhand.to_s}, dealer is showing #{dealerhand.to_a[0]}. Hit? "# only show one card...
  answer = gets.chomp
  #still have to check for black jacks... actually no, blackjack apparently doesnt care about black jacks...

  #user hit
  bust = false
  while check_answer(answer) #change to regex
    userhand.give(deck.deal)
      puts "Received #{userhand.to_a[-1]} (#{card_total(userhand)})."
    if card_total(userhand) > BLACKJACK
      puts "You've bust!"
      bust = true
      break
    elsif card_total(userhand) == BLACKJACK
      break
    else
      print "Hit? "
      answer = gets.chomp
    end
  end

  #dealer hit
  while (card_total(dealerhand) <= DEALER_HIT && bust == false)
    dealerhand.give(deck.deal)
    break if card_total(dealerhand) >= BLACKJACK
  end

  puts "Dealer shows #{dealerhand.to_s}."
  win = false
  if card_total(userhand) == BLACKJACK #blackjack
    win = true
  elsif card_total(userhand) > BLACKJACK #bust
    win = false
  elsif card_total(userhand) <= BLACKJACK && card_total(dealerhand) > BLACKJACK # dealer bust
    win = true
  elsif card_total(userhand) > card_total(dealerhand) # normal win user > dealer
    win = true
  end
  if win
    print "You win! (#{card_total(userhand)} vs #{card_total(dealerhand)}) Play Again? "
  else
    print "You lose... (#{card_total(userhand)} vs #{card_total(dealerhand)}) Play Again? "
  end
  dealerhand.newhand.each do |card|
    deck.discard(card)
  end
  userhand.newhand.each do |card|
    deck.discard(card)
  end
  answer = gets.chomp
end while check_answer(answer)


