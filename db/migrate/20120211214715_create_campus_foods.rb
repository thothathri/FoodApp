class CreateCampusFoods < ActiveRecord::Migration
  def change
    create_table :campus_foods do |t|
      t.string :title
      t.string :food
      t.string :location
      t.date :date
      t.string :start
      t.string :end
      t.string :type
      t.text :desc

      t.timestamps
    end
  end
end
