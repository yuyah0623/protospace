class Prototype < ActiveRecord::Base
  has_many :captured_images
  belongs_to :user

  validates :title, :copy, :concept, :captured_images, presence: true

  accepts_nested_attributes_for :captured_images, reject_if: proc { |attribute| attribute['name'].blank? }

  acts_as_taggable_on :tags
end
