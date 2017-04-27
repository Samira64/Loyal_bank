class CreateBankAccountsTable < ActiveRecord::Migration[5.0]
  def change
  	create_table :bank_accounts do |t|
  		t.references :company, foreign_key: true
  		t.string :bank_name
  		t.string :currency
  		t.string :account_type
  		t.string :account_number
  		t.string :swift_code
  		t.string :bank_address
  		t.string :username
  		t.string :password
  		t.string :logo
  		t.json :custom_fields

  		t.timestamps
  end
  
end
end
