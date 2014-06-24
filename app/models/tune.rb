class Tune < ActiveRecord::Base
  belongs_to :user
  validates :song_title, :author, presence: true

end