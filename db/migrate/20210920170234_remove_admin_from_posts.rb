class RemoveAdminFromPosts < ActiveRecord::Migration[6.0]
  def change
    remove_column :posts, :admin, :boolean
  end
end
