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
        case transaction.type
          when 'credit'
            credit = format_amount(transaction.amount.abs)
            debit = format_amount(0)
          when 'debit'
            credit = format_amount(0)
            debit = format_amount(transaction.amount.abs)
        end
        total += transaction.total
        balance = format_amount(total)
        puts "#{date} || #{credit} || #{debit} || #{balance}"
        n += 1
      end
    end
  end

  def show_deposits
    puts deposits_header
    show_selected('credit')
  end

  def show_withdrawals
    puts withdrawals_header
    show_selected('debit')
  end

  def show_selected(choice)
    total = 0
    n = 1
    while n <= account.transactions.length
      account.transactions.map do |transaction|
        if transaction.type == choice
          date = format_date(transaction.date)
          amount = format_amount(transaction.amount.abs)
          puts "#{date} || #{amount}"
        end
      n += 1
      end
    end
  end
end
