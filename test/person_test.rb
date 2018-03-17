require 'minitest/autorun'
require 'minitest/pride'
require './lib/person'
require 'pry'
class PersonTest < Minitest::Test
  def test_it_exists
    person1 = Person.new("Minerva", 1000)
    assert_instance_of Person, person1
  end

  def test_it_has_attributes
    person1 = Person.new("Minerva", 1000)
    assert_equal "Minerva", person1.name
    assert_equal 1000, person1.cash
  end
end
