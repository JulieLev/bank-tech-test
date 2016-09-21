require 'transaction'
require 'date'

describe Transaction do
  subject(:transaction) { Transaction.new }
  subject(:credit_transaction) { Transaction.new(credit: 200) }
  subject(:debit_transaction) { Transaction.new(debit: 100) }
  subject(:dated_transaction) { Transaction.new(credit: 20, date: different_date)}

  today = Date.new(2016, 9, 21)
  different_date = Date.new(2016, 9, 1)

  describe '#initialize' do
    it 'has an initial credit value of zero' do
      expect(transaction.credit).to eq 0
    end

    it 'has an initial debit value of zero' do
      expect(transaction.debit).to eq 0
    end

    it 'has an default date value of today' do
      allow(Date).to receive(:today).and_return(Date.new(2016, 9, 21))
      expect(transaction.date).to eq today
    end
  end

  describe '#credit' do
    it 'can have a credit' do
      expect(credit_transaction.credit).to eq 200
      expect(credit_transaction.debit).not_to eq 200
    end
  end

  describe '#debit' do
    it 'can have a debit' do
      expect(debit_transaction.debit).to eq 100
      expect(debit_transaction.credit).not_to eq 100
    end
  end

  describe '#date' do
    it 'can accept a different date' do
      expect(dated_transaction.date).to eq different_date
      expect(dated_transaction.date).not_to eq today
    end
  end
end
