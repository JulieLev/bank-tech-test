require 'date'
require_relative 'bank_account'

class Statement

  attr_reader :account

  def initialize(account)
    @account = account
  end

  def statement_header
    "date || credit || debit || balance"
  end

  def format_date(date)
    date.strftime("%d/%m/%Y")
  end

  def format_amount(amount)
    sprintf('%.2f', amount)
  end

  def show_statement
    puts statement_header
    total = 0
    n = 1
    while n <= @account.transactions.length
      @account.transactions.map do |transaction|
        date = format_date(transaction[0])
        credit_amount = transaction[1].abs
        debit_amount = transaction[2].abs
        total += (credit_amount - debit_amount)
        date = format_date(transaction[0])
        credit = format_amount(credit_amount)
        debit = format_amount(debit_amount)
        balance = format_amount(total)
        puts "#{date} || #{credit} || #{debit} || #{balance}"
        n += 1
      end
    end
  end
end
