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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20161208072400) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "auth_group", force: :cascade do |t|
    t.string "name", limit: 80, null: false
    t.index "name varchar_pattern_ops", name: "auth_group_name_253ae2a6331666e8_like", using: :btree
    t.index ["name"], name: "auth_group_name_key", unique: true, using: :btree
  end

  create_table "auth_group_permissions", force: :cascade do |t|
    t.integer "group_id",      null: false
    t.integer "permission_id", null: false
    t.index ["group_id", "permission_id"], name: "auth_group_permissions_group_id_permission_id_key", unique: true, using: :btree
    t.index ["group_id"], name: "auth_group_permissions_0e939a4f", using: :btree
    t.index ["permission_id"], name: "auth_group_permissions_8373b171", using: :btree
  end

  create_table "auth_permission", force: :cascade do |t|
    t.string  "name",            limit: 255, null: false
    t.integer "content_type_id",             null: false
    t.string  "codename",        limit: 100, null: false
    t.index ["content_type_id", "codename"], name: "auth_permission_content_type_id_codename_key", unique: true, using: :btree
    t.index ["content_type_id"], name: "auth_permission_417f1b1c", using: :btree
  end

  create_table "auth_user", force: :cascade do |t|
    t.string   "password",     limit: 128, null: false
    t.datetime "last_login"
    t.boolean  "is_superuser",             null: false
    t.string   "username",     limit: 30,  null: false
    t.string   "first_name",   limit: 30,  null: false
    t.string   "last_name",    limit: 30,  null: false
    t.string   "email",        limit: 254, null: false
    t.boolean  "is_staff",                 null: false
    t.boolean  "is_active",                null: false
    t.datetime "date_joined",              null: false
    t.index "username varchar_pattern_ops", name: "auth_user_username_51b3b110094b8aae_like", using: :btree
    t.index ["username"], name: "auth_user_username_key", unique: true, using: :btree
  end

  create_table "auth_user_groups", force: :cascade do |t|
    t.integer "user_id",  null: false
    t.integer "group_id", null: false
    t.index ["group_id"], name: "auth_user_groups_0e939a4f", using: :btree
    t.index ["user_id", "group_id"], name: "auth_user_groups_user_id_group_id_key", unique: true, using: :btree
    t.index ["user_id"], name: "auth_user_groups_e8701ad4", using: :btree
  end

  create_table "auth_user_user_permissions", force: :cascade do |t|
    t.integer "user_id",       null: false
    t.integer "permission_id", null: false
    t.index ["permission_id"], name: "auth_user_user_permissions_8373b171", using: :btree
    t.index ["user_id", "permission_id"], name: "auth_user_user_permissions_user_id_permission_id_key", unique: true, using: :btree
    t.index ["user_id"], name: "auth_user_user_permissions_e8701ad4", using: :btree
  end

  create_table "chat_rooms", force: :cascade do |t|
    t.string   "title"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_chat_rooms_on_user_id", using: :btree
  end

  create_table "django_admin_log", force: :cascade do |t|
    t.datetime "action_time",                 null: false
    t.text     "object_id"
    t.string   "object_repr",     limit: 200, null: false
    t.integer  "action_flag",     limit: 2,   null: false
    t.text     "change_message",              null: false
    t.integer  "content_type_id"
    t.integer  "user_id",                     null: false
    t.index ["content_type_id"], name: "django_admin_log_417f1b1c", using: :btree
    t.index ["user_id"], name: "django_admin_log_e8701ad4", using: :btree
  end

  create_table "django_content_type", force: :cascade do |t|
    t.string "app_label", limit: 100, null: false
    t.string "model",     limit: 100, null: false
    t.index ["app_label", "model"], name: "django_content_type_app_label_45f3b1d93ec8c61c_uniq", unique: true, using: :btree
  end

  create_table "django_migrations", force: :cascade do |t|
    t.string   "app",     limit: 255, null: false
    t.string   "name",    limit: 255, null: false
    t.datetime "applied",             null: false
  end

  create_table "django_session", primary_key: "session_key", id: :string, limit: 40, force: :cascade do |t|
    t.text     "session_data", null: false
    t.datetime "expire_date",  null: false
    t.index "session_key varchar_pattern_ops", name: "django_session_session_key_461cfeaa630ca218_like", using: :btree
    t.index ["expire_date"], name: "django_session_de54fa62", using: :btree
  end

  create_table "messages", force: :cascade do |t|
    t.text     "body"
    t.integer  "user_id"
    t.integer  "chat_room_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["chat_room_id"], name: "index_messages_on_chat_room_id", using: :btree
    t.index ["user_id"], name: "index_messages_on_user_id", using: :btree
  end

  create_table "polls_choice", force: :cascade do |t|
    t.string  "choice_text", limit: 200, null: false
    t.integer "votes",                   null: false
    t.integer "question_id",             null: false
    t.index ["question_id"], name: "polls_choice_7aa0f6ee", using: :btree
  end

  create_table "polls_contact", force: :cascade do |t|
    t.string "email", limit: 254, null: false
    t.string "name",  limit: 50,  null: false
  end

  create_table "polls_contact_users", force: :cascade do |t|
    t.integer "contact_id", null: false
    t.integer "user_id",    null: false
    t.index ["contact_id", "user_id"], name: "polls_contact_users_contact_id_user_id_key", unique: true, using: :btree
    t.index ["contact_id"], name: "polls_contact_users_6d82f13d", using: :btree
    t.index ["user_id"], name: "polls_contact_users_e8701ad4", using: :btree
  end

  create_table "polls_question", force: :cascade do |t|
    t.string   "question_text", limit: 200, null: false
    t.datetime "pub_date",                  null: false
  end

  create_table "polls_user", force: :cascade do |t|
    t.string "email",    limit: 254, null: false
    t.string "username", limit: 20,  null: false
  end

  create_table "polls_userdetail", force: :cascade do |t|
    t.string  "address", limit: 500, null: false
    t.integer "user_id",             null: false
    t.index ["user_id"], name: "polls_userdetail_user_id_key", unique: true, using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "auth_group_permissions", "auth_group", column: "group_id", name: "auth_group_permissio_group_id_689710a9a73b7457_fk_auth_group_id"
  add_foreign_key "auth_group_permissions", "auth_permission", column: "permission_id", name: "auth_group_permission_id_1f49ccbbdc69d2fc_fk_auth_permission_id"
  add_foreign_key "auth_permission", "django_content_type", column: "content_type_id", name: "auth_content_type_id_508cf46651277a81_fk_django_content_type_id"
  add_foreign_key "auth_user_groups", "auth_group", column: "group_id", name: "auth_user_groups_group_id_33ac548dcf5f8e37_fk_auth_group_id"
  add_foreign_key "auth_user_groups", "auth_user", column: "user_id", name: "auth_user_groups_user_id_4b5ed4ffdb8fd9b0_fk_auth_user_id"
  add_foreign_key "auth_user_user_permissions", "auth_permission", column: "permission_id", name: "auth_user__permission_id_384b62483d7071f0_fk_auth_permission_id"
  add_foreign_key "auth_user_user_permissions", "auth_user", column: "user_id", name: "auth_user_user_permiss_user_id_7f0938558328534a_fk_auth_user_id"
  add_foreign_key "chat_rooms", "users"
  add_foreign_key "django_admin_log", "auth_user", column: "user_id", name: "django_admin_log_user_id_52fdd58701c5f563_fk_auth_user_id"
  add_foreign_key "django_admin_log", "django_content_type", column: "content_type_id", name: "djan_content_type_id_697914295151027a_fk_django_content_type_id"
  add_foreign_key "messages", "chat_rooms"
  add_foreign_key "messages", "users"
  add_foreign_key "polls_choice", "polls_question", column: "question_id", name: "polls_choice_question_id_246c99a640fbbd72_fk_polls_question_id"
  add_foreign_key "polls_contact_users", "polls_contact", column: "contact_id", name: "polls_contact_u_contact_id_5e837eab73646ef0_fk_polls_contact_id"
  add_foreign_key "polls_contact_users", "polls_user", column: "user_id", name: "polls_contact_users_user_id_69ecf3ef19c02202_fk_polls_user_id"
  add_foreign_key "polls_userdetail", "polls_user", column: "user_id", name: "polls_userdetail_user_id_404254ca7bab47b8_fk_polls_user_id"
end
