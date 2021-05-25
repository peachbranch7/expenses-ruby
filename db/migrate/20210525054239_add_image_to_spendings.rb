class AddImageToSpendings < ActiveRecord::Migration[6.0]
  def change
    add_column :spendings, :image, :string
  end
end
