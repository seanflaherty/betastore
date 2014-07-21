class AddStateCodeToCustomers < ActiveRecord::Migration
  def change
    add_column :customers, :state_code, :string
  end
end
