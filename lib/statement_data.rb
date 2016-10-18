require 'transaction'
require 'date'

class StatementData

  attr_reader :transaction # only required for test?

  def initialize(transaction)
    @transaction = transaction
  end

  def output
    date = transaction.date
    credit = (transaction.type == 'credit' ? transaction.amount : 0)
    debit = (transaction.type == 'debit' ? transaction.amount : 0)
    total = transaction.total
    output = [date, credit, debit, total]
    output
  end
end
