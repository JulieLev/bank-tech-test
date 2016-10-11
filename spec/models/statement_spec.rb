require 'statement'
require 'date'

describe 'Statement' do
  let(:account) { double :bank_account }

  subject(:statement) { Statement.new(account) }

  describe '#show_statement' do
    it "should print a simple statement when run" do
      allow(Date).to receive(:today).and_return(Date.new(2012, 01, 14))
      allow(statement.account).to receive(:transactions).and_return([[Date.today,100,0],[Date.today,0,20]])

      expect { statement.show_statement }.to output("date || credit || debit || balance
                                              14/01/2012 || 100.00 || 0.00 || 100.00
                                              14/01/2012 || 0.00 || 20.00 || 80.00").to_stdout
    end
  end
end

#[#<Transaction:0x007fa1051203b0 @debit=0, @credit=100, @date=#<Date: 2016-10-10 ((2457672j,0s,0n),+0s,2299161j)>>, #<Transaction:0x007fa105118778 @debit=20, @credit=0, @date=#<Date: 2016-10-10 ((2457672j,0s,0n),+0s,2299161j)>>]
