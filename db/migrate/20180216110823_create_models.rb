class CreateModels < ActiveRecord::Migration[5.1]
  def change
    enable_extension :citext

    create_table :users do |t|
      t.citext :email, null: false
      t.string :password_digest, null: false
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :infix
      t.timestamps
    end

    create_table :sellers do |t|
      t.references :user
      t.timestamps
    end

    create_table :buyers do |t|
      t.references :user
      t.timestamps
    end

    create_table :admins do |t|
      t.references :user
      t.timestamps
    end

    add_index :users, :email, unique: true

    add_foreign_key :admins, :users, on_delete: :cascade
    add_foreign_key :buyers, :users, on_delete: :cascade
    add_foreign_key :sellers, :users, on_delete: :cascade
  end
end
