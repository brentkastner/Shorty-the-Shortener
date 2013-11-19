require 'test_helper'

class UrlsControllerTest < ActionController::TestCase
  test "should get new" do
    get :new
    assert_response :success
  end

  test 'should create new url entry' do
    assert_difference('Url.count') do
      get :create, url: {url: 'http://www.google.com'}
    end

    assert_redirected_to '/urls/new'
    assert_not_nil(flash[:short_code])

  end

  test 'redirect to end url' do

    get :create, url: {url: urls(:one).url}

    get :show, :id => flash[:short_code]

    puts assigns(:url)
    assert_redirected_to(urls(:one).url)

  end

end
