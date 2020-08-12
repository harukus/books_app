class Book < ApplicationRecord
  mount_uploader :picture, PictureUploader
  has_one_attached :image
end
