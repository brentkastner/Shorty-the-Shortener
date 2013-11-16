class AddRefererToClicksource < ActiveRecord::Migration
  def change
    add_column :clicksources, :referer, :string
  end
end
