class AddColsToBlogs < ActiveRecord::Migration
  def change
  	add_column :blogs, :external_links, :integer 
  	add_column :blogs, :links, :integer
  	add_column :blogs, :mozrank, :float
  	add_column :blogs, :page_authority, :float
  	add_column :blogs, :domain_authority, :float 
  end
end
