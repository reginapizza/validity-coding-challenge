class CreateEmailVerifications < ActiveRecord::Migration[5.2]
  def change
    create_table :email_verifications do |t|
      t.string :address
      t.string :verification_status
      t.integer :email_address_id
      t.timestamps
    end
  end
end
