class Article < ApplicationRecord
  require 'carrierwave/orm/activerecord'
  mount_uploaders :pic, ImagesUploader
  belongs_to :user, inverse_of: :articles
  has_many :images, dependent: :destroy

  enum theme: %i[Nature Building Calture]
end
