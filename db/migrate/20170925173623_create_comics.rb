class CreateComics < ActiveRecord::Migration[5.1]
  def change
    create_table :comics do |t|
      t.string :title
      t.float :price
      t.boolean :purchased
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
