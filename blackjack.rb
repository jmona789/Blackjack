def slow_text(statement)
	statement.each_char do |letter|
		sleep 0.05
		print letter
	end
end

#Welcomes player
def welcome
 slow_text("Welcome to the Blackjack Table\n")
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
  slow_text("You were dealt a(n) #{card1}, and a(n) #{card2}\n")
end

#displays card dealt to player
def display_deal(new_card)
  if new_card == 10
    new_card = ["10", "Jack", "Queen", "King"].sample
  elsif new_card == 11
    new_card = "Ace"
  else
  end
  slow_text("You were dealt a(n) #{new_card}\n")
end

#Displays players card total
def display_card_total(card_total)
  slow_text("Your cards add up to #{card_total}.\n")
end

def display_card_total_w_ace(card_total)
  slow_text("Your cards add up to #{card_total} or #{card_total - 10}\n")
end

#chip count
def display_chip_count(chip_total)
  slow_text("You have $#{chip_total} in chips.\n")
  return chip_total
end

#user chooses bet
def betting
  slow_text("Please type an amount to bet: $")
  amount = get_user_input
  if is_number(amount) == false
    invalid_command_betting
    betting
  else
    if amount.to_i > $chip_total
      bet_too_much
      betting
    else
      return amount
    end
  end
end

#tests if bet is a number
def is_number(string)
  true if Float(string) rescue false
end

#Tells player he has not enough money if he bets too much
def bet_too_much
  slow_text("You don't have that much money, please bet again.\n")
end


#Displays dealers first card
def display_card_dealer(card1_dealer)
  slow_text("The dealer is showing one card with a value of #{card1_dealer}.\n")
end

#Prompts player to hit or stay
def prompt_user_first_hit
  slow_text("Type 'h' to hit, 's' to stay, or 'd' to double.\n")
end

def prompt_user
 slow_text("Type 'h' to hit, 's' to stay.\n")
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
  if $your_cards.include?(11)  && your_card_total > 21
    $your_cards.delete(11)
    your_cards(11)
    your_cards(1)
    display_card_total(your_card_total)
    return your_card_total
    elsif $your_cards.include?(11)
    display_card_total_w_ace(your_card_total)
    return your_card_total
  else
    display_card_total(your_card_total)
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
  
########Change this method to first_hit and make new hit? method
########option to double or split

#asks palyer if he wants to hit, stay or double
def first_hit?(new_card_total)
  prompt_user_first_hit
  h_or_s_or_d = get_user_input
  new_card_total = new_card_total
  if h_or_s_or_d == "d"
    double(new_card_total)
  elsif h_or_s_or_d == "h"
   hit(new_card_total)
  elsif h_or_s_or_d == "s"
    return your_card_total
  else
    invalid_command
    first_hit?(new_card_total)
  end
end

#asks palyer if he wants to hit or stay
def hit?(new_card_total)
  prompt_user
  h_or_s = get_user_input
  new_card_total = new_card_total
  if h_or_s == "h"
    hit(new_card_total)
  elsif h_or_s == "s"
    return your_card_total
  else
    invalid_command
    hit?(new_card_total)
  end
end


#deals one card and doubles bet
def double(new_card_total)
  new_card_total = new_card_total
  if $bet.to_i * 2 > $chip_total
    slow_text("Not enough money to double.\n")
    if $your_cards.include?(11)
      display_card_total_w_ace(your_card_total)
    else
      display_card_total(your_card_total)
    end
    first_hit?(your_card_total)
  else
    new_card = deal_card
    your_cards(new_card)
    new_card_total = your_card_total
    display_deal(new_card)
    if $your_cards.include?(11)  && your_card_total > 21
      $your_cards.slice!($your_cards.index(11))
      your_cards(1)
      return your_card_total
    elsif your_card_total > 21
      display_card_total(your_card_total)
      $bet = $bet.to_i * 2
      slow_text("Busted! You lose.\n")
      $chip_total -= $bet.to_i
      lost_all_money?
      return your_card_total
    else
      $bet = $bet.to_i * 2
      return your_card_total
    end
  end
end

#deals one more card into the players hand
def hit(new_card_total)
  new_card = deal_card
  your_cards(new_card)
  new_card_total = new_card_total
  display_deal(new_card)
  new_card_total = your_card_total
  if $your_cards.include?(11)  && your_card_total > 21
    $your_cards.slice!($your_cards.index(11))
    your_cards(1)
    new_card_total = your_card_total
    display_card_total(your_card_total)
    hit?(your_card_total)
  elsif your_card_total > 21
    display_card_total(your_card_total)
    slow_text("Busted! You lose.\n")
    $chip_total -= $bet.to_i
    lost_all_money?
  elsif $your_cards.include?(11)
    display_card_total_w_ace(your_card_total)
    hit?(your_card_total)
    return your_card_total
  else
    display_card_total(your_card_total)
    hit?(your_card_total)
    return your_card_total
  end 
end

#adds a card to the players hand
def your_cards(card)
  $your_cards << card
end

#calculates the players card total
def your_card_total
  $your_cards.inject{|sum,x| sum + x }
end

#calculates the dealers card total
def dealer_cards(card = 0)
  $dealer_cards << card
  return $dealer_cards.inject{|sum,x| sum + x }
end


######method may or may not work, need to test
######not yet impletmented
def spilt
  $your_cards2 = []
  $your_cards2 << $your_cards.pop
end

#displays invalid bet message
def invalid_command_betting
  slow_text("Please enter a valid bet.\n")
end

#returns invalid command if user does not type h or s
def invalid_command
  slow_text("That is not a valid command.\n")
end

#dealer reveals his hand
def dealer_reveal(card_total_dealer)
  if card_total_dealer == 22
    card_total_dealer = 12
    slow_text("The dealer reveals his full card total of #{card_total_dealer}\n")
    return card_total_dealer
  else
slow_text("The dealer reveals his full card total of #{card_total_dealer}\n")
    return card_total_dealer
  end
end

#hits for delaer is hand below 16
def dealer_hit?(card_total_dealer)
until card_total_dealer > 16 do
 slow_text("The dealer hits.\n")
  card_total_dealer += deal_card
  slow_text("The dealer has a new card total of #{card_total_dealer}\n")
  end
  return card_total_dealer
end

#compares dealers and players hnad to detrimine winner
def compare_hands(card_total_dealer, card_total)
  if card_total_dealer == card_total
    slow_text("You pushed!\n")
  elsif card_total_dealer > 21 && card_total < 22
    slow_text("The dealer busts! You have won!\n")
   $chip_total += $bet.to_i
  elsif card_total > card_total_dealer && card_total < 22 && card_total_dealer < 22
    slow_text("You have won!\n")
    $chip_total += $bet.to_i
  else
    slow_text("You lost!\n")
    $chip_total -= $bet.to_i
  end
end

#Asks player if he wants to play again
def play_again
  slow_text("You have $#{$chip_total} in chips.\n")
  slow_text("Type 'p' to play again or 'q' to quit.\n")
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

#resets chip count to $500 and infoms the player
def lost_all_money?
  if $chip_total == 0
    slow_text("You have lost all your money, your chip count has been reset to $500\n")
    $chip_total = 500
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
  new_card_total = first_hit?(card_total) 
  display_card_total(new_card_total)
  dealer_reveal(ctd)
  ctd = dealer_hit?(ctd)
  compare_hands(ctd, new_card_total)
  lost_all_money?
end