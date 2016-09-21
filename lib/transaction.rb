class Transaction
attr_reader :debit, :credit, :date, :total

  def initialize(debit: 0, credit: 0, date: Date.today)
    @debit = debit
    @credit = credit
    @date = date
  end

  def total
    credit - debit
  end
end
