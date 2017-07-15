class BankAccount < ActiveRecord::Base
	belongs_to :company
	attr_accessor :logo_file_name
	attr_accessor :logo_content_type 
	has_attached_file :logo, styles: { small: "150x150>", thumb: "100x100>" },
		 default_url: "/images/missing.png",
		 path: ":rails_root/public/:class/:attachment/:style/:id/:filename",
		 url: "/:class/:attachment/:style/:id/:filename"
    validates_attachment_content_type :logo, content_type: /\Aimage\/.*\z/, allow_nil: true
	validates :bank_name, :currency, :account_type, :swift_code, :account_number, presence: true
	validates :account_number, numericality: true
end