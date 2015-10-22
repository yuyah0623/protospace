class CapturedImage < ActiveRecord::Base
  belongs_to :prototype
  mount_uploader :name, ImageUploader
end
