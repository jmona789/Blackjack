#Welcomes player
def welcome
 puts "Welcome to the Blackjack Table"
 sleep(1)
end

#Deals a card
def deal_card
  a = [2, 2, 2, 2, 3, 3, 3, 3, 4, 4, 4, 4, 5, 5, 5, 5, 6, 6, 6, 6, 7, 7, 7, 7, 8, 8, 8, 8, 9, 9, 9, 9, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 11, 11, 11, 11]
  b = [2, 2, 2, 2, 3, 3, 3, 3, 4, 4, 4, 4, 5, 5, 5, 5, 6, 6, 6, 6, 7, 7, 7, 7, 8, 8, 8, 8, 9, 9, 9, 9, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 11, 11, 11, 11]
  c = [2, 2, 2, 2, 3, 3, 3, 3, 4, 4, 4, 4, 5, 5, 5, 5, 6, 6, 6, 6, 7, 7, 7, 7, 8, 8, 8, 8, 9, 9, 9, 9, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 11, 11, 11, 11]
  d = [2, 2, 2, 2, 3, 3, 3, 3, 4, 4, 4, 4, 5, 5, 5, 5, 6, 6, 6, 6, 7, 7, 7, 7, 8, 8, 8, 8, 9, 9, 9, 9, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 11, 11, 11, 11]
  e = [2, 2, 2, 2, 3, 3, 3, 3, 4, 4, 4, 4, 5, 5, 5, 5, 6, 6, 6, 6, 7, 7, 7, 7, 8, 8, 8, 8, 9, 9, 9, 9, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 11, 11, 11, 11]
  f = [2, 2, 2, 2, 3, 3, 3, 3, 4, 4, 4, 4, 5, 5, 5, 5, 6, 6, 6, 6, 7, 7, 7, 7, 8, 8, 8, 8, 9, 9, 9, 9, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 11, 11, 11, 11]
  cards = a + b + c + d + e + f
  cards.sample
end


#displays the cards the player is dealt
def display_cards(card1, card2)
  if card1 == 10
    card1 = ["10", "Jack", "Queen", "King"].sample
  end
  if card2 == 10
    card2 = ["10", "Jack", "Queen", "King"].sample
  end
  if card1 == 11
    card1 = "Ace"
  end
  if card2 == 11
    card2 = "Ace"
  end
  puts "You were dealt a(n) #{card1}, and a(n) #{card2}"
  sleep(1)
end

#displays card dealt to player
def display_deal(new_card)
  if new_card == 10
    new_card = ["10", "Jack", "Queen", "King"].sample
  elsif new_card == 11
    new_card = "Ace"
  else
  end
  puts "You were dealt a(n) #{new_card}"
  sleep(1)
end

#Displays players card total
def display_card_total(card_total)
  puts "Your cards add up to #{card_total}."
  sleep(1)
end

def display_card_total_w_ace(card_total)
  puts "Your cards add up to #{card_total} or #{card_total - 10}"
  sleep(1)
end

#chip count
def display_chip_count(chip_total)
  puts "You have $#{chip_total} in chips."
  sleep(1)
  return chip_total
end

#user chooses bet
def betting
  print "Please type an amount to bet: $"
  amount = get_user_input
  if amount.to_i > $chip_total
    bet_too_much
    betting
  else
    return amount
  end
end

#Tells player he has not enough money if he bets too much
def bet_too_much
  puts "You don't have that much money, please bet again."
  sleep(1)
end


#Displays dealers first card
def display_card_dealer(card1_dealer)
  puts "The dealer is showing one card with a value of #{card1_dealer}."
  sleep(1)
end

#Prompts player to hit or stay
def prompt_user
  puts "Type 'h' to hit, 's' to stay, or 'd' to double."
end

#Gets input form player
def get_user_input
  gets.chomp
end

#Deals dealers first card
def card1_dealer
  card1_dealer = deal_card
end

#Deals dealers second card
def card2_dealer
  card2_dealer = deal_card
end

#Calculate dealers card total
def card_total_dealer (card1, card2)
  card_total_dealer = card1 + card2 
  if card_total_dealer == 22 
    card_total_dealer = 12
  else
  end
  return card_total_dealer
end

#deals two cards for player
def initial_round
  card1 = deal_card
  your_cards(card1)
  card2 = deal_card
  your_cards(card2)
  display_cards(card1, card2)
  change_face_card1_to_num
  change_face_card2_to_num
  if $your_cards.include?(11)  && your_cards > 21
    $your_cards.delete(11)
    your_cards(11)
    your_cards(1)
    card_total = your_cards
    display_card_total(your_cards)
    return your_cards
    elsif $your_cards.include?(11)
    display_card_total_w_ace(your_cards)
    return your_cards
  else
    display_card_total(your_cards)
  end
end

#is true when player would bust but has an ace
#used to change aces to ones when them being 11 would bust
def aces?(card_total, card, card2 = 1)
  card_total > 21 && card == 11 || card_total > 21 && card2 == 11
end


#Chages face cards for card 1 to numbers
def change_face_card1_to_num
  if $card1 == "Jack"
    $card1 = 10
  elsif $card1 == "Queen"
    $card1 = 10
  elsif $card1 == "King"
    $card1 = 10
  elsif $card1 == "Ace"
    $card1 = 11
  else
  end
end

#Changes face cards for card 2 to numbers
def change_face_card2_to_num
  if $card2 == "Jack"
    $card2 = 10
  elsif $card2 == "Queen"
    $card2 = 10
  elsif $card2 == "King"
    $card2 = 10
  elsif $card2 == "Ace"
    $card2 = 11
  else
  end
end
  

#deals a new card if player hits, doesn't if he stays
def hit?(new_card_total)
  prompt_user
  h_or_s_or_d = get_user_input
  new_card_total = new_card_total
  if h_or_s_or_d == "d"
    double(new_card_total)
  elsif h_or_s_or_d == "h"
   hit(new_card_total)
  elsif h_or_s_or_d == "s"
    return your_cards
  else
    invalid_command
    hit?(new_card_total)
  end
end

#deals one card and doubles bet when user doubles
def double(new_card_total)
  new_card_total = new_card_total
  if $bet.to_i * 2 > $chip_total
    puts "Not enough money to double."
    sleep(1)
    if $your_cards.include?(11)
      display_card_total_w_ace(your_cards)
    else
      display_card_total(your_cards)
    end
    sleep(1)
    hit?(your_cards)
  else
    new_card = deal_card
    your_cards(new_card)
    new_card_total = your_cards
    display_deal(new_card)
    if $your_cards.include?(11)  && your_cards > 21
      $your_cards.slice!($your_cards.index(11))
      your_cards(1)
      return your_cards
    elsif your_cards > 21
      display_card_total(your_cards)
      $bet = $bet.to_i * 2
      puts "Busted! You lose."
      $chip_total -= $bet.to_i
      sleep(1)
      lost_all_money?
      return your_cards
    else
      $bet = $bet.to_i * 2
      return your_cards
    end
  end
end

def hit(new_card_total)
  new_card = deal_card
  your_cards(new_card)
  new_card_total = new_card_total
  display_deal(new_card)
  new_card_total = your_cards
  if $your_cards.include?(11)  && your_cards > 21
    $your_cards.slice!($your_cards.index(11))
    your_cards(1)
    new_card_total = your_cards
    display_card_total(your_cards)
    hit?(your_cards)
  elsif your_cards > 21
    display_card_total(your_cards)
    puts "Busted! You lose."
    $chip_total -= $bet.to_i
    sleep(1)
    lost_all_money?
  elsif $your_cards.include?(11)
    display_card_total_w_ace(your_cards)
    hit?(your_cards)
    return your_cards
  else
    display_card_total(your_cards)
    hit?(your_cards)
    return your_cards
  end 
end

####Make a mmethod that continually adds cards dealt to an array and returns value
####of  sum of all array values

def your_cards(card = 0)
  $your_cards << card
  return $your_cards.inject{|sum,x| sum + x }
end

def dealer_cards(card = 0)
  $dealer_cards << card
  return $dealer_cards.inject{|sum,x| sum + x }
end

def spilt
end

#returns invalid command if user does not type h or s
def invalid_command
  puts "That is not a valid command"
  sleep(1)
end

#dealer reveals his hand
def dealer_reveal(card_total_dealer)
  if card_total_dealer == 22
    card_total_dealer = 12
    puts "The dealer reveals his full card total of #{card_total_dealer}"
    sleep(1)
    return card_total_dealer
  else
    puts "The dealer reveals his full card total of #{card_total_dealer}"
    sleep(1)
    return card_total_dealer
  end
end

#hits for delaer is hand below 16
def dealer_hit?(card_total_dealer)
until card_total_dealer > 16 do
  puts "The dealer hits."
  sleep(1)
  card_total_dealer += deal_card
  puts "The dealer has a new card total of #{card_total_dealer}"
  sleep(1)
  end
  return card_total_dealer
end

#compares dealers and players hnad to detrimine winner
def compare_hands(card_total_dealer, card_total)
  if card_total_dealer == card_total
    puts "You pushed!"
    sleep(1)
  elsif card_total_dealer > 21 && card_total < 22
    puts "The dealer busts! You have won!"
   $chip_total += $bet.to_i
    sleep(1)
  elsif card_total > card_total_dealer && card_total < 22 && card_total_dealer < 22
    puts "You have won!"
    $chip_total += $bet.to_i
    sleep(1)
  else
    puts "You lost!"
    $chip_total -= $bet.to_i
    sleep(1)
  end
end

#Asks player if he wants to play again
def play_again
  puts "You have $#{$chip_total} in chips."
  sleep(1)
  puts "Type 'p' to play again or 'q' to quit."
  p_or_q = gets.chomp
  if p_or_q == "p"
    $your_cards = []
    runner
  elsif p_or_q == "q" 
    abort
  else
    invalid_command
    play_again
  end
end

def lost_all_money?
  if $chip_total == 0
    puts "You have lost all your money, your chip count has been reset to $500"
    $chip_total = 500
    sleep(1)
    play_again
  else
    play_again
  end
end

$chip_total = 500
$bet
$your_cards = []
welcome
$dealer_cards = []


#runs program
def runner
  display_chip_count($chip_total)
  $bet = betting
  dc1 = card1_dealer
  dc2 = card2_dealer
  ctd = card_total_dealer(dc1, dc2)
  display_card_dealer(dc1)
  card_total = initial_round 
  new_card_total = hit?(card_total) 
  display_card_total(new_card_total)
  dealer_reveal(ctd)
  ctd = dealer_hit?(ctd)
  compare_hands(ctd, new_card_total)
  lost_all_money?
end