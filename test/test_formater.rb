require 'minitest/autorun'
require 'derecho'
require 'formater'

class FormaterTest < Minitest::Test

  def setup
    @message = Formater.new('long beach', 'ms')
  end


  def test_city_and_state_format
    expected_message = "MS/Long_Beach"
    assert_equal expected_message, @message.create_state_city_string
  end
end