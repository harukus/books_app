class AddDetailsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :provider, :string, null: false, default: ''
    add_column :users, :uid, :string, null: false, null: false, default: ''
    add_column :users, :name, :string, null: false, null: false, default: ''
    add_column :users, :image_url, :string, null: false, null: false, default: ''
  end
end
