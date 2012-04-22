class CreateUservotes < ActiveRecord::Migration
  def change
    create_table :uservotes do |t|
      t.string :fuid
      t.integer :eventid

      t.timestamps
    end
  end
end
