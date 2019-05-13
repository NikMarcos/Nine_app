class Image < ApplicationRecord
  belongs_to :user, inverse_of: :images
  mount_uploader :pic, ImagesUploader
end
