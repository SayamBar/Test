class AddPublishedAtToArticles < ActiveRecord::Migration[7.0]
  def change
    add_column :articles, :publish_at ,:datetime
  end
end
