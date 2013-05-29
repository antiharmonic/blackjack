class Deck
  attr_reader :deck
  
  @@shuffle_amount = 20
  def initialize
    @discard = Array.new
    @dealt = Array.new
    @deck = Array.new
  end
  
  def deal
    #check to see if @deck is empty
    if @deck.length == 0
      @deck = @discard
      @discard = []
      puts "Reshuffling..."
      shuffle_deck(@@shuffle_amount)
    end
    @dealt.push(@deck.pop) #something like that
    @dealt.last
  end
  
  def discard(card)
    #ensure the card was dealt
    if @dealt.include? card
      #remove from dealt array (so that someone can't try to discard it again)
      @dealt.delete(card)
      #add to discard pile
      @discard.push(card)
    else #error
      puts "#{card} already discarded."
    end
  end
  
  def shuffle
    @deck = @deck.shuffle #hooray for ruby methods
  end
  
  private
  def shuffle_deck(amt)
    amt.times { |i| shuffle }
  end

  
end