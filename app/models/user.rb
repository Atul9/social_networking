class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_friendship
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
  acts_as_commontator

  has_one :picture, as: :imageable
  accepts_nested_attributes_for :picture, allow_destroy: true
  validates_presence_of :firstname, :username, :lastname
  validates :username, format: {with: /\A[a-zA-Z\d]+\z/, :message => "can only contain letters and numbers."}
  validates :firstname, :lastname, format: { with: /\A[a-zA-Z]+\z/, message: "only allows letters" }
end
