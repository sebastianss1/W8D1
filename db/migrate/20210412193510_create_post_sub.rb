class CreatePostSub < ActiveRecord::Migration[5.2]
  def change
    create_table :post_subs do |t|
      t.integer :sub_id, null: false 
      t.integer :post_id, null: false 
    end
    add_index :post_subs, :post_id
    add_index :post_subs, :sub_id
  end
end
