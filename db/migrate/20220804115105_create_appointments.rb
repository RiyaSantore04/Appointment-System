class CreateAppointments < ActiveRecord::Migration[6.1]
  def change
    create_table :appointments do |t|
      t.integer :counsellor_id
      t.integer :customer_id
      t.date :date
      t.time :time

      t.timestamps
    end
  end
end
