class CreateServices < ActiveRecord::Migration[6.1]
  def change
    create_table :services do |t|
      t.integer :counsellor_id
      t.string :service_name

      t.timestamps
    end
  end
end
