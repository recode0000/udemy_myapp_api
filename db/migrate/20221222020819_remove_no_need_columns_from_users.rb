class RemoveNoNeedColumnsFromUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :password_digest, :string
    remove_column :users, :is_active, :boolean
    remove_column :users, :is_admin, :boolean
  end
end
