class AddAttachmentTextFileToBooks < ActiveRecord::Migration
  def self.up
    change_table :books do |t|
      t.attachment :text_file
    end
  end

  def self.down
    drop_attached_file :books, :text_file
  end
end
