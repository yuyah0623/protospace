class Prototype < ActiveRecord::Base
  has_many :captured_images, dependent: :delete_all
  has_many :comments
  belongs_to :user

  validates :title, :copy, :concept, :captured_images, presence: true

  accepts_nested_attributes_for :captured_images, reject_if: :reject_captured_image

  acts_as_taggable_on :tags

  def reject_captured_image(attributed)
    attributed['name'].blank?
  end

  def main_image
    captured_images.main.first.name
  end

  def sub_images
    captured_images.sub
  end
end
