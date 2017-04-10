class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.string :details
      t.references :patient, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
