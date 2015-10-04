class Picture < ActiveRecord::Base
  has_attached_file :collage, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :collage, content_type: /\Aimage\/.*\Z/
  belongs_to :post
end
