class User < ActiveRecord::Base
  has_many :tune
  validates :email, presence: true
  validates :password, presence: true


end