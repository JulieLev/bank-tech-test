require 'bank_account'
require 'date'

describe BankAccount do
  subject(:account) { BankAccount.new }

  it 'has an initial balance of zero' do
    expect(account.balance).to eq(0)
  end

  it 'has a start date' do
    expect(account.date).to eq(Date.today)
  end

  it 'can record a deposit' do
    account.deposit(5)
    expect(account.transactions.length).to eq 1
    expect(account.transactions[0]).to eq [Date.today, 5, 0, 5]
  end

  it 'can record a withdrawal' do
    account.withdraw(3)
    expect(account.transactions.length).to eq 1
    expect(account.transactions[0]).to eq [Date.today, 0, 3, -3]
  end

  it "should print a simple statement when run" do
    allow(Date).to receive(:today).and_return(Date.new(2012, 01, 14))
    account.deposit(100)
    account.withdraw(20)
    expect { account.show_statement }.to output("date || credit || debit || balance
                                            14/01/2012 || 100.00 || 0.00 || 100.00
                                            14/01/2012 || 0.00 || 20.00 || 80.00").to_stdout
  end
end
