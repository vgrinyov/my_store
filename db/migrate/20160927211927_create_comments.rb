class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.text :body
      t.integer :user_id
      t.integer :commentable_id
      t.string :commentable_type # item or blogpost
      t.timestamps
    end
  end
end
