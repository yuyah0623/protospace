class Prototype < ActiveRecord::Base
  has_many :captured_images

  validates :title, :copy, :concept, :captured_images, presence: true

  accepts_nested_attributes_for :captured_images

  acts_as_taggable_on :tags
end
