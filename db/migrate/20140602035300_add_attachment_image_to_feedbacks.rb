class AddAttachmentImageToFeedbacks < ActiveRecord::Migration
  def self.up
    change_table :feedbacks do |t|
      t.attachment :image
    end
  end

  def self.down
    drop_attached_file :feedbacks, :image
  end
end
