require 'date'
require 'transaction'

class BankAccount

  attr_reader :balance, :date, :transactions

  def initialize
    @balance = 0
    @date = Date.today
    @transactions = []
  end

  def withdraw(amount, date=Date.today)
    withdrawal_update_balance(amount)
    @debit = amount
    add_transaction(date, 0, @debit)
  end

  def deposit(amount, date=Date.today)
    deposit_update_balance(amount)
    @credit = amount
    add_transaction(date, @credit, 0)
  end

  def show_statement
    puts "date || credit || debit || balance"
    n = 1
    while n <= @transactions.length
      @transactions.map do |transaction|
        date = transaction[0].strftime("%d/%m/%Y")
        credit = sprintf('%.2f', transaction[1].abs)
        debit = sprintf('%.2f', transaction[2].abs)
        balance = sprintf('%.2f', transaction[3])
        puts "#{date} || #{credit} || #{debit} || #{balance}"
        n += 1
      end
    end
  end

private

  def deposit_update_balance(amount)
    @balance += amount
  end

  def withdrawal_update_balance(amount)
    @balance -= amount
  end

  def add_transaction(date, credit, debit)
    transaction = Transaction.new(date: date, credit: credit, debit: debit)
    new_transaction = [transaction.date, transaction.credit, transaction.debit, transaction.total]
    @transactions << new_transaction
  end

end
