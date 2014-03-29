class CreateRiches < ActiveRecord::Migration
  def change
    create_table :riches do |t|

      t.timestamps
    end
  end
end
