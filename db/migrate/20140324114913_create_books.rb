class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.string :description
      t.text :book_text
      t.belongs_to :user

      t.timestamps
    end
  end
end
