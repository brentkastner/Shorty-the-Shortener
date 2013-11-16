class CreateClicksources < ActiveRecord::Migration
  def change
    create_table :clicksources do |t|
      t.string :ip
      t.string :agent
      t.references :url, index: true

      t.timestamps
    end
  end
end
