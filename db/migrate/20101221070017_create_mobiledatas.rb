class CreateMobiledatas < ActiveRecord::Migration
  def self.up
    create_table :mobiledatas do |t|
      t.string :modelname
      t.string :brand
      t.string :color
      t.string :posid
      t.string :image_url
      t.integer :quantity

      t.string :gnetwork #General - 2g / 3g Network
      t.string :minternal #Memory - Internal
      t.string :mcardslot #Memory - Card Slot
      t.string :dwlan #Data - WLan
      t.string :dbluetooth #Data- Bluetooth
      t.string :dusb #Data - USB
      t.integer :camera #Camera 1 / 0
      t.string :cprimary #Camera - Primary
      t.string :cvideo #Camera - Video
      t.string :csecondary #Camera - Secondary
      t.string :fos #Features - OS
      t.string :fradio #Features - Radio
      t.string :fjava #Features - Java
      t.string :battery
      t.string :formfactor

      t.decimal :iosv, :scale=>2, :precision=>8
      t.decimal :iop, :scale=>2, :precision=>8
      t.decimal :itv, :scale=>2, :precision=>8
      t.decimal :itp, :scale=>2, :precision=>8
      t.decimal :ithp, :scale=>2, :precision=>8
      t.decimal :fl, :scale=>2, :precision=>8
      t.decimal :fv, :scale=>2, :precision=>8
      t.decimal :fp, :scale=>2, :precision=>8
      t.decimal :fpr, :scale=>2, :precision=>8
      t.decimal :c100, :scale=>2, :precision=>8
      t.decimal :p700, :scale=>2, :precision=>8
      t.decimal :p1500, :scale=>2, :precision=>8
      t.decimal :nocontract, :scale=>2, :precision=>8

      t.timestamps
    end
  end

  def self.down
    drop_table :mobiledatas
  end
end
