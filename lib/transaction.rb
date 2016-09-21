class Transaction
attr_reader :debit, :credit, :date

  def initialize(debit: 0, credit: 0, date: Date.today)
    @debit = debit
    @credit = credit
    @date = date
  end
end
