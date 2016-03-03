class CreateTokens < ActiveRecord::Migration
  def change
    create_table :tokens do |t|
      t.references :setting, index: true, foreign_key: true
      t.string :refresh_token
      t.string :access_token
      t.datetime :expires_at

      t.timestamps null: false
    end
  end
end
