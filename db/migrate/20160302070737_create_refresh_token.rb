class CreateRefreshToken < ActiveRecord::Migration
  def change
    create_table :refresh_tokens do |t|
      t.string :refresh_token
    end
  end
end
