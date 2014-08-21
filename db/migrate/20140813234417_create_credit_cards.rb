class CreateCreditCards < ActiveRecord::Migration
  def change
    create_table :credit_cards do |t|
      t.belongs_to :customer
      t.string :number
      t.string :exp_date

      t.timestamps
    end
  end
end
