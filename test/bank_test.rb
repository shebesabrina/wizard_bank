require 'minitest/autorun'
require 'minitest/pride'
require './lib/person'
require './lib/bank'
require 'pry'
class BankTest < Minitest::Test
  def test_it_exists
    chase = Bank.new("JP Morgan Chase")

    assert_instance_of Bank, chase
  end

  def test_it_has_attributes
    chase = Bank.new("JP Morgan Chase")

    assert_equal "JP Morgan Chase", chase.name
  end

  def test_open_account
    chase = Bank.new("JP Morgan Chase")
    person1 = Person.new("Minerva", 1000)
    chase.open_account(person1)

    assert_instance_of Hash, chase.accounts
    assert_equal person1, chase.accounts.keys.first
    assert_equal 0, chase.accounts[person1][:balance]
  end

  def test_deposit
    chase = Bank.new("JP Morgan Chase")
    person1 = Person.new("Minerva", 1000)
    chase.open_account(person1)
    chase.deposit(person1, 750)

    assert_equal 750, chase.accounts[person1][:balance]
    assert_equal 250, person1.cash
  end

  def test_it_cannot_over_deposit
    chase = Bank.new("JP Morgan Chase")
    person1 = Person.new("Minerva", 1000)
    chase.open_account(person1)

    result = "Minerva does not have enough cash to perform this deposit."
    assert_equal 0, chase.accounts[person1][:balance]
    assert_equal 1000, person1.cash
    assert_equal result, chase.deposit(person1, 1001)
  end

  def test_withdrawl
    chase = Bank.new("JP Morgan Chase")
    person1 = Person.new("Minerva", 1000)
    chase.open_account(person1)
    chase.deposit(person1, 750)
    chase.withdrawl(person1, 50)

    assert_equal 700, chase.accounts[person1][:balance]
    assert_equal 300, person1.cash
  end

  def test_sufficient_funds_of_withdrawl
    chase = Bank.new("JP Morgan Chase")
    person1 = Person.new("Minerva", 1000)
    chase.open_account(person1)
    binding.pry
    result = "Insufficient funds."
    assert_equal 0, chase.accounts[person1][:balance]
    assert_equal 1000, person1.cash
    assert_equal result, chase.withdrawl(person1, 1001)
  end

end
