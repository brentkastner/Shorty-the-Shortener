require 'test_helper'

class ClicksourceTest < ActiveSupport::TestCase

  test 'add ip and user agent to click sources' do
    u = Url.create(:url => 'http://www.google.com')
    assert u.present?

    c = Clicksource.create!(:ip => '192.168.0.1', :agent => 'mac', :url_id => u.id)

    c.present?


  end

  test 'add ip only' do
    u = Url.create(:url => 'http://www.google.com')
    assert u.present?
    c = Clicksource.create!(:ip => '192.168.0.1', :url_id => u.id)

    c.present?
  end

  test 'agent only' do
    u = Url.create(:url => 'http://www.google.com')
    assert u.present?
    c = Clicksource.create!(:agent => 'mac', :url_id => u.id)

    c.present?
  end

  test 'url_id must not be nil' do

    assert_raise(ActiveRecord::RecordInvalid) do
      c = Clicksource.create!(:agent => 'mac')
    end
  end

end
