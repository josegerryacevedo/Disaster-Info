class AddImageToDisasters < ActiveRecord::Migration[6.1]
  def change
    add_column :disasters,:image, :string
  end
end
