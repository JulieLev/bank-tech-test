require 'transaction'
require 'bank_account'
require 'statement'
require 'date'

describe 'show complete statement' do
  account = BankAccount.new
  date = Date.new(2016, 10, 30)
  date_2 = Date.new(2016, 10, 31)
  date_3 = Date.new(2016, 11, 1)
  statement = Statement.new(account)

  context 'user makes a deposit of 1000' do
    it 'should display a one line statement with correct details and balance' do
      account.deposit(1000, date)
      expect { statement.show_statement }.to output("date || credit || debit || balance\n30/10/2016 || 1000.00 || 0.00 || 1000.00\n").to_stdout
    end
  end

  context 'user makes a second deposit of 2000' do
    it 'should display a two line statement with correct details and balance' do
      account.deposit(2000, date_2)
      expect { statement.show_statement }.to output("date || credit || debit || balance\n30/10/2016 || 1000.00 || 0.00 || 1000.00\n31/10/2016 || 2000.00 || 0.00 || 3000.00\n").to_stdout
    end
  end

  context 'user then makes a withdrawal of 500' do
    it 'should display a three line statement with correct details and balance' do
      account.withdraw(500, date_3)
      expect { statement.show_statement }.to output("date || credit || debit || balance\n30/10/2016 || 1000.00 || 0.00 || 1000.00\n31/10/2016 || 2000.00 || 0.00 || 3000.00\n01/11/2016 || 0.00 || 500.00 || 2500.00\n").to_stdout
    end
  end
end
