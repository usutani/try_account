class CreateAccountFreezes < ActiveRecord::Migration[6.1]
  def change
    create_table :account_freezes do |t|
      t.belongs_to :account, null: false, foreign_key: true

      t.timestamps
    end
  end
end
