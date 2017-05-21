class AddAdminIdToArticles < ActiveRecord::Migration[5.1]
  def change
    add_column :articles, :admin_id, :integer
  end
end
