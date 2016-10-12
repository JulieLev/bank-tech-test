require 'date'
require_relative 'bank_account'
require_relative 'transaction'

class Statement

  attr_reader :account

  def initialize(account)
    @account = account
  end

  def statement_header
    "date || credit || debit || balance"
  end

  def deposits_header
    "date || credit"
  end

  def withdrawals_header
    "date || debit"
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
    while n <= account.transactions.length
      account.transactions.map do |transaction|
        date = format_date(transaction.date)
        credit = format_amount(transaction.credit.abs)
        debit = format_amount(transaction.debit.abs)
        total += transaction.total
        balance = format_amount(total)
        puts "#{date} || #{credit} || #{debit} || #{balance}"
        n += 1
      end
    end
  end

  def show_deposits_or_withdrawals(choice) # choice = 'credit' or 'debit'
    case choice
      when 'deposits'
        puts deposits_header
        filter = 'credit'
      when 'withdrawals'
        puts withdrawals_header
        filter = 'debit'
    end

    total = 0
    n = 1
    while n <= account.transactions.length
      account.transactions.map do |transaction|
        if transaction.filter > 0
          date = format_date(transaction.date)
          amount = format_amount(filter)
          puts "#{date} || #{amount}"
        end
        n += 1
      end
    end
  end
end
