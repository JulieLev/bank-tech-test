require 'transaction'
require 'date'

describe Transaction do
  subject(:transaction) { Transaction.new }
  subject(:credit_transaction) { Transaction.new(type: 'credit', amount: 200) }
  subject(:debit_transaction) { Transaction.new(type: 'debit', amount: 100) }

  today = Date.new(2016, 9, 21)

  describe '#initialize' do
    it 'has an initial amount value of zero' do
      expect(transaction.amount).to eq 0
    end

    it 'has an initial type value of invalid' do
      expect(transaction.type).to eq 'invalid'
    end

    it 'has an default date value of today' do
      allow(Date).to receive(:today).and_return(Date.new(2016, 9, 21))
      expect(transaction.date).to eq today
    end

    it 'has an initial total value of zero' do
      expect(transaction.total).to eq 0
    end
  end

  context 'a credit transaction' do
    it 'has an amount' do
      expect(credit_transaction.amount).to eq 200
    end

    it "has a type of 'credit'" do
      expect(credit_transaction.type).to eq 'credit'
    end

    it 'has a positive total' do
      expect(credit_transaction.total).to eq 200
    end
  end

  context 'a debit transaction' do
    it ' has an amount' do
      expect(debit_transaction.amount).to eq 100
    end

    it "has a type of 'debit'" do
      expect(debit_transaction.type).to eq 'debit'
    end

    it 'has a negative total' do
      expect(debit_transaction.total).to eq -100
    end
  end

  describe '#date' do
    different_date = Date.new(2016, 9, 1)
    subject(:dated_transaction) { Transaction.new(amount: 20, date: different_date) }

    it 'can accept a different date' do
      expect(dated_transaction.date).to eq different_date
      expect(dated_transaction.date).not_to eq today
    end
  end
end
