class Book < ActiveRecord::Base
	belongs_to :user
	has_attached_file :book
  validates_attachment :book, content_type: { content_type: "application/pdf" }
  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
   has_attached_file :text_file
  validates_attachment_content_type :text_file, content_type: { content_type: "text/plain" }
end
