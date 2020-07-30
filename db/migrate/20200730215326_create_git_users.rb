class CreateGitUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :git_users do |t|
      t.string :provider, null: false, unique: true
      t.string :uid, null: false, unique: true
      t.string :name, null: false
      t.string :image_url, null: false

      t.timestamps
    end
  end
end
