class AddImageIdToArticles < ActiveRecord::Migration[6.0]
  def change
    add_column :articles, :image_id, :string
  end
end
