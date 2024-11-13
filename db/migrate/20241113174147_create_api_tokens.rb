class CreateApiTokens < ActiveRecord::Migration[8.0]
  def change
    create_table :api_tokens do |t|
      t.string :token, null: false
      t.datetime :expires_at, null: false, default: -> { "datetime('now', '+1 year')" }
      t.boolean :active, default: true
      t.string :user_email, null: false

      t.timestamps
    end

    add_index :api_tokens, %i[token user_email], unique: true
  end
end
