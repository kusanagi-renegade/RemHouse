class CreateForms < ActiveRecord::Migration[7.0]
  def change
    create_table :forms do |t|
      t.string :email, null: false, limit: 100
      t.string :phone, null: false, limit: 30
      t.string :name, null: false, limit: 100
      t.string :variety, null: false
      t.text :other, limit: 1000
      t.string :status, default: "Новая заявка!"

      t.timestamps
    end
  end
end
