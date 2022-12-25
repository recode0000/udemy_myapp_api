class AddDeviseTokenAuthInfoToUsers < ActiveRecord::Migration[6.0]
  def change
    ## Required
    add_column :users, :provider, :string, null: false, default: "email"
    add_column :users, :uid, :string, null: false, default: ""

    ## Database authenticatable
    add_column :users, :encrypted_password, :string, null: false, default: ""

    ## Recoverable
    add_column :users, :reset_password_token, :string
    add_column :users, :reset_password_sent_at, :datetime
    add_column :users, :allow_password_change, :boolean, default: false

    ## Rememberable
    add_column :users, :remember_created_at, :datetime

    ## Tokens
    add_column :users, :tokens, :json

    ## Confirmable
    # t.string   :confirmation_token
    # t.datetime :confirmed_at
    # t.datetime :confirmation_sent_at
    # t.string   :unconfirmed_email # Only if using reconfirmable

    ## Lockable
    # t.integer  :failed_attempts, :default => 0, :null => false # Only if lock strategy is :failed_attempts
    # t.string   :unlock_token # Only if unlock strategy is :email or :both
    # t.datetime :locked_at
  end
end
