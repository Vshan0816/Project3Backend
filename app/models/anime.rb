class Anime < ApplicationRecord
    belongs_to : studio
    validates :title, presence: true
    validates :synopsis, presence: true
    validates :release_year, presence: true
end
