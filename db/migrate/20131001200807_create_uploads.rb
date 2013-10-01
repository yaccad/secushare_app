class CreateUploads < ActiveRecord::Migration
  def change
    create_table :uploads do |t|
      t.string :name
      t.string :content
      t.integer :user_id

      t.timestamps
    end
    add_index :uploads, [:user_id, :created_at]
  end
end
