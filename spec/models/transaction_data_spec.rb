# Not implemented - need to rethink!

require 'transaction_data'
require 'date'

describe 'TransactionData' do
  let(:account) { double :bank_account }
  date_1 = Date.new(2012, 01, 10)
  date_2 = Date.new(2012, 01, 14)
  let(:credit_transaction) { double :transaction, type: 'credit', amount: 1000, date: date_1, total: 1000 }
  let(:debit_transaction) { double :transaction, type: 'debit', amount: 500, date: date_2, total: -500 }
  subject(:transaction_data_credit) { TransactionData.new(credit_transaction) }
  subject(:transaction_data_debit) { TransactionData.new(debit_transaction) }

  context 'statement output for a transaction' do
    it 'should output the transaction data for one credit transaction' do
      expect(transaction_data_credit.output).to eq [date_1, 1000, 0, 1000]
    end

    it 'should output the transaction data for one debit transaction' do
      expect(transaction_data_debit.output).to eq [date_2, 0, 500, -500]
    end
  end
end
