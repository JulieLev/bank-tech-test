require 'statement_data'
require 'date'

describe 'StatementData' do
  let(:account) { double :bank_account }
  date_1 = Date.new(2012, 01, 10)
  date_2 = Date.new(2012, 01, 14)
  let(:credit_transaction) { double :transaction, type: 'credit', amount: 1000, date: date_1, total: 1000 }
  let(:debit_transaction) { double :transaction, type: 'debit', amount: 500, date: date_2, total: -500 }
  subject(:statement_data_credit) { StatementData.new(credit_transaction) }
  subject(:statement_data_debit) { StatementData.new(debit_transaction) }

  context 'statement output for a transaction' do
    it 'has a transaction' do
      expect(statement_data_credit.transaction).to eq credit_transaction
    end

    it 'should output the statement data for one credit transaction' do
      expect(statement_data_credit.output).to eq [date_1, 1000, 0, 1000]
    end

    it 'should output the statement data for one debit transaction' do
      expect(statement_data_debit.output).to eq [date_2, 0, 500, -500]
    end
  end
end
