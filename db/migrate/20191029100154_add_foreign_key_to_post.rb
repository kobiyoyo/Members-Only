class AddForeignKeyToPost < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :user, :refernces
  end
end
