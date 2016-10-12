require 'date'

class Transaction
attr_reader :type, :amount, :date, :total

  def initialize(type: 'invalid', amount: 0, date: Date.today)
    @type = type
    @amount = amount
    @date = date
  end

  def total
    @type == 'credit' ? amount : -amount
  end
end
