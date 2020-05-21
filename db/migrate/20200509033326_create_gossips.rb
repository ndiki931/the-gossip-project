class CreateGossips < ActiveRecord::Migration[5.2]
  def change
    create_table :gossips do |t|
      t.string :content
      t.string :title
      t.integer :nb_like

      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end


