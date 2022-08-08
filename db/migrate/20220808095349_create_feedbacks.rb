class CreateFeedbacks < ActiveRecord::Migration[6.1]
  def change
    create_table :feedbacks do |t|
      t.integer :counsellor_id
      t.integer :customer_id
      t.string :description

      t.timestamps
    end
  end
end
