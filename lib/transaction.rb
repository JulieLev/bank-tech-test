require 'date'

class Transaction
attr_reader :type, :amount, :date, :total, :full_statement_output

  def initialize(type: 'invalid', amount: 0, date: Date.today)
    @type = type
    @amount = amount
    @date = date
  end

  def total
    @type == 'credit' ? amount : -amount
  end

  def full_statement_output
    date = transaction.date
    case transaction.type
      when 'credit'
        credit = transaction.amount.abs
        debit = 0
      when 'debit'
        credit = 0
        debit = transaction.amount.abs
    end
    total = transaction.total
    output = [date, credit, debit, total]
    output
  end
end
