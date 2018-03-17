class Bank
  attr_reader :name,
              :accounts

  def initialize(name)
    @name = name
    @accounts = {}
  end

  def open_account(person)
    @accounts[person] = {balance: 0}
  end

  def deposit(person, deposit_amount)
    if deposit_amount <= person.cash
      person.cash -= deposit_amount
      @accounts[person][:balance] += deposit_amount
    else
      "#{person.name} does not have enough cash to perform this deposit."
    end
  end

  def withdrawl(person, withdrawl_amount)
    if withdrawl_amount <= @accounts[person][:balance]
    person.cash += withdrawl_amount
    @accounts[person][:balance] -= withdrawl_amount
    else
      "Insufficient funds."
    end
  end
end
