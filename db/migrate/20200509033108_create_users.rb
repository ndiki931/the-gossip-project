class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :password_digest
      t.string :email
      t.text :bio
      t.integer :age
      t.string :phone_number

      t.timestamps
    end
  end
end



