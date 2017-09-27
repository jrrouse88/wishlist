class AddImageUrlToComics < ActiveRecord::Migration[5.1]
  def change
    add_column :comics, :image_url, :string
  end
end
