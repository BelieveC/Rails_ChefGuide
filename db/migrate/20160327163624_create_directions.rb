class CreateDirections < ActiveRecord::Migration
  def change
    create_table :directions do |t|
      t.string :step
      t.belongs_to :recipe, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
