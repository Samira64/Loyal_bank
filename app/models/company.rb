class Company < ActiveRecord::Base
	has_many :bank_accounts
end