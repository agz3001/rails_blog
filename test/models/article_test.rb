require 'test_helper'

class ArticleTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @user = User.new(email: "taro_0@example.com", password: "password")
  end

  test "should be valid" do
    assert @user.valid?
  end
end
