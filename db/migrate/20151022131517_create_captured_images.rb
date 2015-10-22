class CreateCapturedImages < ActiveRecord::Migration
  def change
    create_table :captured_images do |t|
      t.references :prototype, index: true, foreign_key: true
      t.string     :name
      t.timestamps null: false
    end
  end
end
