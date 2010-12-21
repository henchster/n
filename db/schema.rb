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

ActiveRecord::Schema.define(:version => 20101221070017) do

  create_table "mobiledatas", :force => true do |t|
    t.string   "modelname"
    t.string   "brand"
    t.string   "color"
    t.string   "posid"
    t.string   "image_url"
    t.integer  "quantity"
    t.string   "gnetwork"
    t.string   "minternal"
    t.string   "mcardslot"
    t.string   "dwlan"
    t.string   "dbluetooth"
    t.string   "dusb"
    t.integer  "camera"
    t.string   "cprimary"
    t.string   "cvideo"
    t.string   "csecondary"
    t.string   "fos"
    t.string   "fradio"
    t.string   "fjava"
    t.string   "battery"
    t.string   "formfactor"
    t.decimal  "iosv",       :precision => 8, :scale => 2
    t.decimal  "iop",        :precision => 8, :scale => 2
    t.decimal  "itv",        :precision => 8, :scale => 2
    t.decimal  "itp",        :precision => 8, :scale => 2
    t.decimal  "ithp",       :precision => 8, :scale => 2
    t.decimal  "fl",         :precision => 8, :scale => 2
    t.decimal  "fv",         :precision => 8, :scale => 2
    t.decimal  "fp",         :precision => 8, :scale => 2
    t.decimal  "fpr",        :precision => 8, :scale => 2
    t.decimal  "c100",       :precision => 8, :scale => 2
    t.decimal  "p700",       :precision => 8, :scale => 2
    t.decimal  "p1500",      :precision => 8, :scale => 2
    t.decimal  "nocontract", :precision => 8, :scale => 2
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mobilephones", :force => true do |t|
    t.string   "modelname"
    t.string   "brand"
    t.string   "color"
    t.string   "posid"
    t.integer  "quantity"
    t.string   "image_url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mobileprices", :force => true do |t|
    t.integer  "mobilephone_id",                               :null => false
    t.decimal  "iosv",           :precision => 8, :scale => 2
    t.decimal  "iop",            :precision => 8, :scale => 2
    t.decimal  "itv",            :precision => 8, :scale => 2
    t.decimal  "itp",            :precision => 8, :scale => 2
    t.decimal  "ithp",           :precision => 8, :scale => 2
    t.decimal  "fl",             :precision => 8, :scale => 2
    t.decimal  "fv",             :precision => 8, :scale => 2
    t.decimal  "fp",             :precision => 8, :scale => 2
    t.decimal  "fpr",            :precision => 8, :scale => 2
    t.decimal  "c100",           :precision => 8, :scale => 2
    t.decimal  "p700",           :precision => 8, :scale => 2
    t.decimal  "p1500",          :precision => 8, :scale => 2
    t.decimal  "nocontract",     :precision => 8, :scale => 2
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mobileprofiles", :force => true do |t|
    t.integer  "mobilephone_id", :null => false
    t.string   "gtwognetwork"
    t.string   "gthreegnetwork"
    t.string   "sdimensions"
    t.string   "sweight"
    t.string   "dtype"
    t.string   "dsize"
    t.string   "salerttype"
    t.string   "minternal"
    t.string   "mcardslot"
    t.string   "dwlan"
    t.string   "dbluetooth"
    t.string   "dusb"
    t.string   "cprimary"
    t.string   "cvideo"
    t.string   "csecondary"
    t.string   "fos"
    t.string   "fradio"
    t.string   "fcolor"
    t.string   "fjava"
    t.string   "battery"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
