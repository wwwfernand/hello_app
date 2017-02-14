class ChangeForeignKeyMicroposts < ActiveRecord::Migration[5.0]
  def change
    drop_table :microposts
    create_table :microposts do |t|
      t.text :content
      t.references :user, foreign_key: true

      t.timestamps
    end
    add_index :microposts, [:user_id, :created_at]
  end
end
