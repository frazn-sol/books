class Feedback < ActiveRecord::Base
	has_attached_file :image,
	styles: {
	}
	validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png"]
end
