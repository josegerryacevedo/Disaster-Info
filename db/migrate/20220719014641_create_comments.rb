class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.string :content
      t.belongs_to :disaster
      t.belongs_to :user
      t.timestamps
    end
  end
end
