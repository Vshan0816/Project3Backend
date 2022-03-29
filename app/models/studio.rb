class Studio < ActiveRecord::Base
    has_many :animes, dependent: :destroy
    validates :name, presence: true

end
