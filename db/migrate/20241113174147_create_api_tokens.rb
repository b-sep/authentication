class CreateApiTokens < ActiveRecord::Migration[8.0]
  def change
    create_table :api_tokens do |t|
      t.string :token, null: false
      t.datetime :expires_at, null: false, default: -> { "datetime('now', '+1 year')" }
      t.integer :active, default: 0, null: false
      t.string :user_email, null: false

      t.timestamps
    end

    add_index :api_tokens, :token, unique: true
  end
end
