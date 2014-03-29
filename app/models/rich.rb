class Rich < ActiveRecord::Base
	has_attached_file :doc
  validates_attachment_content_type :doc, :content_type => ['application/pdf']
end
