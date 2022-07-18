class CreateDisasters < ActiveRecord::Migration[6.1]
  def change
    create_table :disasters do |t|
      t.string :title
      t.text :content
      t.string :address
      t.string :long_url
      t.string :short_url
      t.belongs_to :user
      t.timestamps
    end
  end
end
