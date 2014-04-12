class AddTimeToFeedback < ActiveRecord::Migration
  def change
    add_column :feedbacks, :time, :string
  end
end
