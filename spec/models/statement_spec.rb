require 'statement'
require 'date'

describe 'Statement' do
  let(:account) { double :bank_account }
  let(:transaction_1) { double :transaction, credit: 1000, debit: 0, date: Date.new(2012, 01, 10), total: 1000 }
  let(:transaction_2) { double :transaction, credit: 0, debit: 500, date: Date.new(2012, 01, 14), total: -500 }
  subject(:statement) { Statement.new(account) }

  before do
    allow(statement.account).to receive(:transactions).and_return([transaction_1, transaction_2])
  end

  describe '#show_statement' do
    it "should print a simple statement when run" do
      expect { statement.show_statement }.to output("date || credit || debit || balance
10/01/2012 || 1000.00 || 0.00 || 1000.00
14/01/2012 || 0.00 || 500.00 || 500.00\n").to_stdout
    end
  end

  describe "#show_deposits_or_withdrawals('deposits')" do
    it "should print only deposits when run" do
      expect { statement.show_deposits_or_withdrawals('deposits') }.to output("date || credit
10/01/2012 || 1000.00\n").to_stdout
    end
  end

  describe "#show_deposits_or_withdrawals('withdrawals')" do
    it "should print only withdrawals when run" do
      expect { statement.show_deposits_or_withdrawals('withdrawals') }.to output("date || debit
14/01/2012 || 500.00\n").to_stdout
    end
  end
end
