class Removetime < ActiveRecord::Migration
  def change
  	remove_column :feedbacks, :time
  end
end
