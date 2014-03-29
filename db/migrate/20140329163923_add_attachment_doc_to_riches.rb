class AddAttachmentDocToRiches < ActiveRecord::Migration
  def self.up
    change_table :riches do |t|
      t.attachment :doc
    end
  end

  def self.down
    drop_attached_file :riches, :doc
  end
end
