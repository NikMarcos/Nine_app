class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :images, dependent: :destroy
  has_many :musics, dependent: :destroy
  has_many :articles
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         scope :admin,         -> {where(role: 'admin')}
         scope :user,          -> {where(role: 'user')}
end
