class CreateMusicians < ActiveRecord::Migration
  def change
    create_table :musicians do |t|
      t.string :name
    end
  end
end