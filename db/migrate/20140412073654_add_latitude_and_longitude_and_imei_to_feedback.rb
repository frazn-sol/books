class AddLatitudeAndLongitudeAndImeiToFeedback < ActiveRecord::Migration
  def change
    add_column :feedbacks, :latitude, :float
    add_column :feedbacks, :longitude, :float
    add_column :feedbacks, :imei, :integer, :limit => 8
  end
end
