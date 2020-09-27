require 'test_helper'

class ArticlesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get index_url
    assert_response :success
  end

  test "should get show" do
    get show_url
    assert_response :success
  end

  test "should get new" do
    get new_article_url
    assert_response :success
  end

  test "should get edit" do
    get edit_url
    assert_response :success
  end

end
