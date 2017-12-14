class CreateSecretCodes < ActiveRecord::Migration[5.0]
  def change
    create_table :secret_codes do |t|
      t.string :code, null: false

      t.timestamps
    end

    add_index :secret_codes, :code, unique: true
  end
end
