class AddSecretCodeToUsers < ActiveRecord::Migration[5.0]
  def change
    add_reference :users, :secret_code
  end
end
