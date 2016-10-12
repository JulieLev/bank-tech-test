require 'statement'
require 'date'

describe 'Statement' do
  let(:account) { double :bank_account }
  let(:transaction_1) { double :transaction, credit: 100, debit: 0, date: Date.new(2012, 01, 14), total: 100 }
  let(:transaction_2) { double :transaction, credit: 0, debit: 20, date: Date.new(2012, 01, 14), total: -20 }
  subject(:statement) { Statement.new(account) }

  describe '#show_statement' do
    it "should print a simple statement when run" do
      allow(statement.account).to receive(:transactions).and_return([transaction_1, transaction_2])
      expect { statement.show_statement }.to output("date || credit || debit || balance
14/01/2012 || 100.00 || 0.00 || 100.00
14/01/2012 || 0.00 || 20.00 || 80.00\n").to_stdout
    end
  end
end
