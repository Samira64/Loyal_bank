class Company < ActiveRecord::Base
	has_many :bank_accounts
	has_attached_file :logo, styles: { small: "150x150>", thumb: "100x100>" },
		 default_url: "/images/:style/missing.png",
		 path: ":rails_root/public/:class/:attachment/:style/:id/:filename",
		 url: "/:class/:attachment/:style/:id/:filename"
    validates_attachment_content_type :logo, content_type: /\Aimage\/.*\z/, allow_nil: true
    validates :name, length: { minimum: 2, too_short: "%{2} characters is the minimum allowed" }
    validates :name, length: { maximum: 16, too_long: "%{16} characters is the maximum allowed" } 
    validates :name, :directors, presence: true
    validates :name, uniqueness: true

end