class Music < ApplicationRecord
  belongs_to :user, inverse_of: :musics
  mount_uploader :track, MusicsUploader
end
