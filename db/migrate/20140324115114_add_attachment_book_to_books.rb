class AddAttachmentBookToBooks < ActiveRecord::Migration
  def self.up
    change_table :books do |t|
      t.attachment :book
    end
  end

  def self.down
    drop_attached_file :books, :book
  end
end
