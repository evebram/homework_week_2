class Guests

  attr_reader :name, :cash, :song

  def initialize(name, cash, song)
    @name = name
    @cash = cash
    @song = song
  end

  def sufficient_funds(entry_fee)
    return cash >= entry_fee
  end

  def pay_entry_fee(entry_fee)
    if sufficient_funds(entry_fee)
      @cash -= entry_fee
    end
  end

end
