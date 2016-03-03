class CreateSettings < ActiveRecord::Migration
  def change
    create_table :settings do |t|
      t.references :admin, index: true, foreign_key: true
      t.string :google_client_id
      t.string :google_client_secret
      t.string :slack_api_token
      t.string :google_calendar_id

      t.timestamps null: false
    end
  end
end
