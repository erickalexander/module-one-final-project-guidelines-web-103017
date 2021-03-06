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

ActiveRecord::Schema.define(version: 20171115164106) do

  create_table "placements", force: :cascade do |t|
    t.integer "world_cup_id"
    t.integer "team_id"
    t.integer "placement"
  end

  create_table "teams", force: :cascade do |t|
    t.string "name"
  end

  create_table "world_cups", force: :cascade do |t|
    t.integer "year"
    t.text "location"
    t.integer "num_teams"
    t.integer "num_matches"
    t.integer "goals"
    t.float "average_goals_per_game"
    t.integer "average_attendance_per_game"
  end

end
