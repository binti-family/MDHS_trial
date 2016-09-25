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

ActiveRecord::Schema.define(version: 20160925175005) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "postgis"

  create_table "providers", force: :cascade do |t|
    t.string    "name"
    t.boolean   "licensed"
    t.string    "provider_type"
    t.integer   "quality_rating"
    t.integer   "capacity"
    t.string    "city"
    t.string    "zipcode"
    t.string    "county_name"
    t.string    "phone_number"
    t.geography "coordinates",        limit: {:srid=>4326, :type=>"point", :geographic=>true}
    t.datetime  "created_at",                                                                  null: false
    t.datetime  "updated_at",                                                                  null: false
    t.string    "age_range"
    t.string    "gender"
    t.string    "hours_of_operation"
  end

end
