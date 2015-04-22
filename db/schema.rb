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

ActiveRecord::Schema.define(version: 20150422065236) do

  create_table "datasources", force: :cascade do |t|
    t.string   "name"
    t.string   "url"
    t.string   "api"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "sourcetype_id"
    t.integer  "pattern_id"
  end

  add_index "datasources", ["pattern_id"], name: "index_datasources_on_pattern_id"
  add_index "datasources", ["sourcetype_id"], name: "index_datasources_on_sourcetype_id"

  create_table "patterns", force: :cascade do |t|
    t.string   "station_name"
    t.string   "time"
    t.string   "temperature"
    t.string   "rainfall"
    t.string   "dew_point"
    t.string   "wind_direction"
    t.string   "wind_speed"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "periods", force: :cascade do |t|
    t.datetime "datetime"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reports", force: :cascade do |t|
    t.datetime "time"
    t.float    "temperature"
    t.float    "dew_point"
    t.float    "rainfall"
    t.string   "wind_direction"
    t.float    "wind_speed"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "datasource_id"
    t.integer  "station_id"
    t.integer  "period_id"
  end

  add_index "reports", ["datasource_id"], name: "index_reports_on_datasource_id"
  add_index "reports", ["period_id"], name: "index_reports_on_period_id"
  add_index "reports", ["station_id"], name: "index_reports_on_station_id"

  create_table "sourcetypes", force: :cascade do |t|
    t.string   "type_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "stations", force: :cascade do |t|
    t.string   "name"
    t.float    "longitude"
    t.float    "latitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
