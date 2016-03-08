# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160304085238) do

  create_table "assignments", force: :cascade do |t|
    t.string   "name"
    t.string   "repo_name"
    t.datetime "due"
    t.integer  "user_id"
    t.integer  "group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "assignments", ["group_id"], name: "index_assignments_on_group_id"
  add_index "assignments", ["user_id"], name: "index_assignments_on_user_id"

  create_table "groups", force: :cascade do |t|
    t.string   "name"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "groups", ["user_id"], name: "index_groups_on_user_id"

  create_table "member_assignments", force: :cascade do |t|
    t.integer  "member_id"
    t.integer  "assignment_id"
    t.datetime "appointment_date"
    t.string   "link"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "member_assignments", ["assignment_id"], name: "index_member_assignments_on_assignment_id"
  add_index "member_assignments", ["member_id"], name: "index_member_assignments_on_member_id"

  create_table "members", force: :cascade do |t|
    t.string   "name"
    t.integer  "group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "members", ["group_id"], name: "index_members_on_group_id"

  create_table "users", force: :cascade do |t|
    t.string "provider"
    t.string "uid"
    t.string "name"
    t.string "oauth_token"
    t.string "oauth_secret"
    t.string "remember_digest"
  end

end
