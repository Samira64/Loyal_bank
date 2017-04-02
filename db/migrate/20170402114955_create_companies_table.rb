class CreateCompaniesTable < ActiveRecord::Migration[5.0]
  def change
  	create_table :companies do |t|
  		t.string :name
  		t.string :address
  		t.string :director
  		t.string :logo_url
  		t.json :custom_fields

  		t.timestamps
  	end
  end
end
