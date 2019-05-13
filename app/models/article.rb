class Article < ApplicationRecord
  require 'carrierwave/orm/activerecord'
  mount_uploaders :pictures, ImagesUploader
  belongs_to :user, inverse_of: :articles
end
