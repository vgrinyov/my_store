class CreatePositions < ActiveRecord::Migration[5.0]
  def change
    create_table :positions do |t|

      t.timestamps
    end
  end
end
