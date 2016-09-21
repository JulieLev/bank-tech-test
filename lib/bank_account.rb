require 'date'

class BankAccount

  attr_reader :balance, :date, :transactions

  def initialize
    @balance = 0
    @date = Date.today
    @transactions = []
  end

  def withdraw(amount)
    @balance -=amount
    @debit = amount
    date = Date.today
    add_transaction(date, 0, @debit, @balance)
  end

  def deposit(amount)
    @balance +=amount
    @credit = amount
    date = Date.today
    add_transaction(date, @credit, 0, @balance)
  end

  def add_transaction(date, credit, debit, balance)
    transaction = [date, credit, debit, balance]
    @transactions << transaction
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
end
