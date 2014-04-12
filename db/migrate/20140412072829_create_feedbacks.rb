class CreateFeedbacks < ActiveRecord::Migration
  def change
    create_table :feedbacks do |t|
      t.float :q1
      t.float :q2
      t.float :q3
      t.float :q4
      t.float :q5
      t.float :q6
      t.float :q7
      t.float :q8
      t.float :q9
      t.float :q10

      t.timestamps
    end
  end
end
