class CreateSpendings < ActiveRecord::Migration[6.0]
  def change
    create_table :spendings do |t|

      t.timestamps
    end
  end
end
