require 'date'
require 'transaction'

class BankAccount

  attr_reader :show_balance, :date, :transactions

  def initialize
    @balance = 0
    @date = Date.today
    @transactions = []
  end

  def withdraw(amount, date=Date.today)
    withdrawal_update_balance(amount)
    add_transaction(date, 0, amount)
  end

  def deposit(amount, date=Date.today)
    deposit_update_balance(amount)
    add_transaction(date, amount, 0)
  end

  def show_balance
    @balance
  end

  def show_statement
    puts "date || credit || debit || balance"
    total = 0
    n = 1
    while n <= @transactions.length
      @transactions.map do |transaction|
        date = transaction.date.strftime("%d/%m/%Y")
        credit = sprintf('%.2f', transaction.credit.abs)
        debit = sprintf('%.2f', transaction.debit.abs)
        total += transaction.total
        balance = sprintf('%.2f', total)
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
    @transactions << transaction
  end

end
