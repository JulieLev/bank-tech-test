require 'date'
require_relative 'bank_account'

class Statement

  attr_reader :account

  def initialize(account)
    @account = account
  end

  def show_statement
    puts "date || credit || debit || balance"
    total = 0
    n = 1
    while n <= @account.transactions.length
      @account.transactions.map do |transaction|
        date = transaction[0].strftime("%d/%m/%Y")
        credit_amount = transaction[1].abs
        debit_amount = transaction[2].abs
        total += (credit_amount - debit_amount)
        credit = sprintf('%.2f', credit_amount )
        debit = sprintf('%.2f', debit_amount)
        balance = sprintf('%.2f', total)
        puts "#{date} || #{credit} || #{debit} || #{balance}"
        n += 1
      end
    end
  end
end
