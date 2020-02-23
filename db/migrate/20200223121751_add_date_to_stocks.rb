class AddDateToStocks < ActiveRecord::Migration[5.2]
  def change
    add_column :stocks, :price_date, :datetime
  end
end
