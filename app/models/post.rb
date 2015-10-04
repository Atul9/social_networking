class Post < ActiveRecord::Base
  acts_as_commontable
  include PublicActivity::Model
  tracked owner: ->(controller, model) { controller.current_user }
  has_many :pictures, as: :imageable
  accepts_nested_attributes_for :pictures, allow_destroy: true
end
