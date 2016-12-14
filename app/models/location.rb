class Location < ActiveRecord::Base
	belongs_to :user
	belongs_to :category
	has_many :reviews
	has_many :review2s, :dependent => :destroy

has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/


	

	def average_stars
	review2s.average(:stars)
	end


def self.search(place)
where("place LIKE ?", "%#{place}%")
end

def self.search(search)
	where("place LIKE ?", "%#{search}%") 
	where("place LIKE ?", "%#{search}%")
end 

end





