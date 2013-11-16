require 'test_helper'

class UrlTest < ActiveSupport::TestCase

  test 'creating a url lets us fetch a short code' do
    my_url = Url.create(:url => 'http://www.xbox.com')
    assert my_url.short_code.present?
  end

  test 'existing urls have short codes' do
    my_url = Url.create(:url => 'http://www.google.com')
    found_url = Url.find(my_url.id)
    assert found_url.short_code.present?
    assert_equal my_url.short_code, found_url.short_code

  end
  #test 'converting a short code to an id'

  test 'finding a url from a known short code' do
    my_url = Url.create(:url => 'http://google.com')
    assert_equal my_url, Url.find_using_short_code!(my_url.short_code)
  end
  test 'finding a url from a invalid short code raises an exception' do
    assert_raises ActiveRecord::RecordNotFound do
      Url.find_using_short_code! 'non-existant-short-code'
    end
  end

  test 'url contains number of clicks' do
    my_url = Url.create(:url => 'http://google.com')
    my_url.save
    assert_not_nil my_url.clicks
  end

  test 'clicks increment when click_counter function is called' do
    my_url = Url.create(:url => 'http://google.com')
    my_url.save

    starting_click_count = my_url.clicks

    my_url.click_counter

    my_url.reload
    ending_click_count = my_url.clicks

    assert_equal(ending_click_count - starting_click_count, 1)

  end

  test 'fail on invalid URI' do

    assert_raise(ActiveRecord::RecordInvalid) do
      my_url = Url.create!(:url => '1234$$$-0921')

    end

  end

  test 'valid URIs get saved' do
    my_url = Url.create(:url => 'http://www.google.com')

    assert my_url.present?
  end

  #test 'number of clicks increments every time redirect is called'

  test 'urls are case insensitive' do
    my_url = Url.create!(:url => 'HTTP://www.google.com')
    assert my_url.present?
  end
end
