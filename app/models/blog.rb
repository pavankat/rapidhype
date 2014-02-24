class Blog < ActiveRecord::Base
  belongs_to :channel
  belongs_to :language
  belongs_to :user
  attr_accessible :alexa, :approved, :avg_mon_imps, :description, :desired_price, :language, :page_rank, :title, :url, :external_links, :links, :mozrank, :page_authority, :domain_authority 
end
