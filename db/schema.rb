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

ActiveRecord::Schema.define(version: 2021_09_03_053202) do

  create_table "articles", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "city", primary_key: "ID", id: :integer, charset: "latin1", force: :cascade do |t|
    t.string "Name", limit: 35, default: "", null: false
    t.string "CountryCode", limit: 3, default: "", null: false
    t.string "District", limit: 20, default: "", null: false
    t.integer "Population", default: 0, null: false
    t.index ["CountryCode"], name: "CountryCode"
  end

  create_table "comments", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "commenter"
    t.text "body"
    t.bigint "article_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["article_id"], name: "index_comments_on_article_id"
  end

  create_table "country", primary_key: "Code", id: { type: :string, limit: 3, default: "" }, charset: "latin1", force: :cascade do |t|
    t.string "Name", limit: 52, default: "", null: false
    t.column "Continent", "enum('Asia','Europe','North America','Africa','Oceania','Antarctica','South America')", default: "Asia", null: false
    t.string "Region", limit: 26, default: "", null: false
    t.float "SurfaceArea", default: 0.0, null: false
    t.integer "IndepYear", limit: 2
    t.integer "Population", default: 0, null: false
    t.float "LifeExpectancy"
    t.float "GNP"
    t.float "GNPOld"
    t.string "LocalName", limit: 45, default: "", null: false
    t.string "GovernmentForm", limit: 45, default: "", null: false
    t.string "HeadOfState", limit: 60
    t.integer "Capital"
    t.string "Code2", limit: 2, default: "", null: false
  end

  create_table "countrylanguage", primary_key: ["CountryCode", "Language"], charset: "latin1", force: :cascade do |t|
    t.string "CountryCode", limit: 3, default: "", null: false
    t.string "Language", limit: 30, default: "", null: false
    t.column "IsOfficial", "enum('T','F')", default: "F", null: false
    t.float "Percentage", default: 0.0, null: false
    t.index ["CountryCode"], name: "CountryCode"
  end

  create_table "posts", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "city", "country", column: "CountryCode", primary_key: "Code", name: "city_ibfk_1"
  add_foreign_key "comments", "articles"
  add_foreign_key "countrylanguage", "country", column: "CountryCode", primary_key: "Code", name: "countryLanguage_ibfk_1"
end
