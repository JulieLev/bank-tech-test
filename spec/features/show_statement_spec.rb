require 'transaction'
require 'bank_account'
require 'statement'
require 'date'

describe 'show complete statement' do
  account = BankAccount.new
  date = Date.new(2016, 10, 30)
  statement = Statement.new(account)

  context 'user makes a deposit' do
    it 'should display a one line statement with correct details and balance' do
      account.deposit(100, date)
      expect { statement.show_statement }.to output("date || credit || debit || balance\n30/10/2016 || 100.00 || 0.00 || 100.00\n").to_stdout
    end
  end
end
