require 'date'
require_relative 'transaction'

class BankAccount

  attr_reader :show_balance, :date, :transactions

  def initialize
    @balance = 0
    @date = Date.today
    @transactions = []
  end

  def withdraw(amount, date=Date.today)
    withdrawal_update_balance(amount)
    add_transaction('debit', amount, date)
  end

  def deposit(amount, date=Date.today)
    deposit_update_balance(amount)
    add_transaction('credit', amount, date)
  end

  def show_balance
    @balance
  end

private
  def deposit_update_balance(amount)
    @balance += amount
  end

  def withdrawal_update_balance(amount)
    @balance -= amount
  end

  def add_transaction(type, amount, date)
    transaction = Transaction.new(type: type, amount: amount, date: date)
    @transactions << transaction
  end

end
