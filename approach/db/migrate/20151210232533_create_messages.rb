class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.text :name
      t.text :email
      t.text :phone
      t.text :company
      t.text :body

      t.timestamps null: false
    end
  end
end
