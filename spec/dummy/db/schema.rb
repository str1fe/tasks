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

ActiveRecord::Schema.define(version: 20140610121130) do

  create_table "articles", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tasuku_taskables_image_requests", force: true do |t|
    t.text     "text"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "description"
    t.string   "image"
  end

  create_table "tasuku_taskables_image_responses", force: true do |t|
    t.string   "image"
    t.integer  "request_id"
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tasuku_taskables_image_responses", ["author_id", "author_type"], name: "tasuku_taskable_image_responses_author"
  add_index "tasuku_taskables_image_responses", ["request_id"], name: "index_tasuku_taskables_image_responses_on_request_id"

  create_table "tasuku_taskables_question_answers", force: true do |t|
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tasuku_taskables_question_answers", ["author_id", "author_type"], name: "tasuku_taskable_question_answers_author"

  create_table "tasuku_taskables_question_options", force: true do |t|
    t.text     "text"
    t.integer  "question_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "correct",     default: false
  end

  add_index "tasuku_taskables_question_options", ["question_id"], name: "index_tasuku_taskables_question_options_on_question_id"

  create_table "tasuku_taskables_question_votes", force: true do |t|
    t.integer  "answer_id"
    t.integer  "option_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tasuku_taskables_question_votes", ["answer_id"], name: "index_tasuku_taskables_question_votes_on_answer_id"
  add_index "tasuku_taskables_question_votes", ["option_id"], name: "index_tasuku_taskables_question_votes_on_option_id"

  create_table "tasuku_taskables_questions", force: true do |t|
    t.text     "text"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "description"
    t.boolean  "multiple"
    t.boolean  "show_statistics", default: true
    t.string   "image"
  end

  create_table "tasuku_taskables_taskable_responses", force: true do |t|
    t.integer  "submittable_id"
    t.string   "submittable_type"
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "task_id"
  end

  add_index "tasuku_taskables_taskable_responses", ["task_id"], name: "index_tasuku_taskables_taskable_responses_on_task_id"

  create_table "tasuku_taskables_text_requests", force: true do |t|
    t.text     "text"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image"
  end

  create_table "tasuku_taskables_text_responses", force: true do |t|
    t.text     "text"
    t.integer  "request_id"
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tasuku_taskables_text_responses", ["author_id", "author_type"], name: "tasuku_taskable_text_responses_author", unique: true

  create_table "tasuku_taskables_url_requests", force: true do |t|
    t.text     "text"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image"
  end

  create_table "tasuku_taskables_url_responses", force: true do |t|
    t.text     "url"
    t.integer  "request_id"
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tasuku_taskables_url_responses", ["author_id", "author_type"], name: "tasuku_taskable_url_responses_author", unique: true
  add_index "tasuku_taskables_url_responses", ["request_id"], name: "index_tasuku_taskables_url_responses_on_request_id"

  create_table "tasuku_taskables_verification_confirmations", force: true do |t|
    t.integer  "verification_id"
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tasuku_taskables_verification_confirmations", ["author_id", "author_type"], name: "tasuku_taskable_verification_confirmation_author"
  add_index "tasuku_taskables_verification_confirmations", ["verification_id"], name: "tasuku_taskable_verification_confirmation_verification"

  create_table "tasuku_taskables_verifications", force: true do |t|
    t.integer  "verifiable_id"
    t.string   "verifiable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tasuku_taskables_verifications", ["verifiable_id", "verifiable_type"], name: "index_tasuku_taskable_verifications_verifiable", unique: true

  create_table "tasuku_tasks", force: true do |t|
    t.integer  "taskable_id"
    t.string   "taskable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "obligatory",    default: false, null: false
  end

  add_index "tasuku_tasks", ["taskable_id", "taskable_type"], name: "index_tasuku_tasks_on_taskable_id_and_taskable_type"

  create_table "users", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
