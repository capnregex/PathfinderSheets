# This file is auto-generated from the current state of the database. Instead 
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your 
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20101104202837) do

  create_table "abilities", :force => true do |t|
    t.string "name",        :limit => 20
    t.string "abrev",       :limit => 3
    t.text   "description"
  end

  add_index "abilities", ["abrev"], :name => "index_abilities_on_abrev"
  add_index "abilities", ["id"], :name => "index_abilities_on_id"
  add_index "abilities", ["name"], :name => "index_abilities_on_name"

  create_table "campaigns", :force => true do |t|
    t.integer  "user_id"
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "characters", :force => true do |t|
    t.integer  "user_id"
    t.string   "name"
    t.integer  "campaign_id"
    t.integer  "race_id"
    t.integer  "cclass_id"
    t.integer  "alignment_id"
    t.integer  "size_id"
    t.integer  "gender_id"
    t.integer  "height"
    t.integer  "weight"
    t.string   "eye_color"
    t.string   "hair_color"
    t.integer  "age"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "terms", :id => false, :force => true do |t|
    t.string   "id"
    t.string   "name"
    t.string   "abrev"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "terms", ["abrev"], :name => "index_terms_on_abrev"
  add_index "terms", ["id"], :name => "index_terms_on_id"
  add_index "terms", ["name"], :name => "index_terms_on_name"

  create_table "users", :force => true do |t|
    t.string   "email",                               :default => "", :null => false
    t.string   "encrypted_password",   :limit => 128, :default => "", :null => false
    t.string   "password_salt",                       :default => "", :null => false
    t.string   "name",                 :limit => 40
    t.string   "reset_password_token"
    t.string   "remember_token"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                       :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "authentication_token"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["confirmation_token"], :name => "index_users_on_confirmation_token", :unique => true
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
