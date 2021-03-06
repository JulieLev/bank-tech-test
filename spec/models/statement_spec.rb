require 'statement'
require 'date'

describe 'Statement' do
  let(:account) { double :bank_account }
  let(:credit_transaction_1) { double :transaction, type: 'credit', amount: 1000, date: Date.new(2012, 01, 10), total: 1000 }
  let(:debit_transaction_1) { double :transaction, type: 'debit', amount: 500, date: Date.new(2012, 01, 14), total: -500 }
  subject(:statement) { Statement.new(account) }

  before do
    allow(statement.account).to receive(:read_transactions).and_return([credit_transaction_1, debit_transaction_1])
  end

  describe '#show_statement' do
    it "should print a simple statement when run" do
      expect { statement.show_statement }.to output("date || credit || debit || balance
10/01/2012 || 1000.00 || 0.00 || 1000.00
14/01/2012 || 0.00 || 500.00 || 500.00\n").to_stdout
    end
  end

  describe '#show_deposits' do
    it "should print only deposits when run" do
      expect { statement.show_deposits }.to output("date || credit
10/01/2012 || 1000.00\n").to_stdout
    end
  end

  describe '#show_withdrawals' do
    it "should print only withdrawals when run" do
      expect { statement.show_withdrawals }.to output("date || debit
14/01/2012 || 500.00\n").to_stdout
    end
  end
end
