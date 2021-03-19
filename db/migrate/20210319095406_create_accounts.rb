class CreateAccounts < ActiveRecord::Migration[6.1]
  def change
    create_table :accounts do |t|
      t.string :email
      t.string :password_digest

      t.timestamps
    end
    add_index :accounts, :email, unique: true
  end
end
