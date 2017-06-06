class Company < ActiveRecord::Base
	has_many :bank_accounts, :dependent => :destroy
	has_attached_file :logo, styles: { small: "150x150>", thumb: "100x100>" },
		 default_url: "/images/:style/missing.png",
		 path: ":rails_root/public/:class/:attachment/:style/:id/:filename",
		 url: "/:class/:attachment/:style/:id/:filename"
    validates_attachment_content_type :logo, content_type: /\Aimage\/.*\z/, allow_nil: true
    validates :name, length: { minimum: 2 }
    validates :name, length: { maximum: 16 } 
    validates :name, :directors, presence: true
    validates :name, uniqueness: true
end