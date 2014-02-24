class CreateBlogs < ActiveRecord::Migration
  def change
    create_table :blogs do |t|
      t.text :title
      t.text :url
      t.text :description
      t.references :channel
      t.references :language
      t.integer :avg_mon_imps
      t.integer :alexa
      t.integer :page_rank
      t.boolean :approved
      t.float :desired_price
      t.references :user

      t.timestamps
    end
    add_index :blogs, :language_id 
    add_index :blogs, :channel_id
    add_index :blogs, :user_id
  end
end