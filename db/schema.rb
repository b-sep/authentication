# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.0].define(version: 2024_11_13_174147) do
  create_table 'api_tokens', force: :cascade do |t|
    t.string 'token', null: false
    t.datetime 'expires_at', default: -> { "datetime('now', '+1 year')" }, null: false
    t.boolean 'active', default: true
    t.string 'user_email', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index %w[token user_email], name: 'index_api_tokens_on_token_and_user_email', unique: true
  end
end
