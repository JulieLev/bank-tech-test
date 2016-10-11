require 'bank_account'
require 'date'

describe BankAccount do
  subject(:account) { BankAccount.new }

  describe '#initialize' do
    it 'has an initial balance of zero' do
      expect(account.show_balance).to eq(0)
    end

    it 'has a start date' do
      expect(account.date).to eq(Date.today)
    end
  end

  describe '#deposit' do
    it 'can record a deposit' do
      account.deposit(5)
      expect(account.transactions.length).to eq 1
      expect(account.show_balance).to eq 5
    end
  end

  describe '#withdraw' do
    it 'can record a withdrawal' do
      account.withdraw(3)
      expect(account.transactions.length).to eq 1
      expect(account.show_balance).to eq -3
    end
  end

  describe '#balance' do
    it 'has a balance' do
      account.deposit(5)
      account.withdraw(3)
      expect(account.show_balance).to eq 2
    end
  end
end
