class CreateAppointments < ActiveRecord::Migration[7.1]
  def change
    create_table :appointments do |t|
      t.references :customer, null: false, foreign_key: true
      t.references :animal, null: false, foreign_key: true
      t.datetime :scheduled_at

      t.timestamps
    end
  end
end
