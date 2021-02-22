class CreateInvestments < ActiveRecord::Migration[6.0]
  def change
    create_table :investments do |t|
      t.string :name
      t.string :broker
      t.string :register_dt

      t.timestamps
    end
  end
end
