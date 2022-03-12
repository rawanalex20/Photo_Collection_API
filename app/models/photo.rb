class Photo < ApplicationRecord
    belongs_to :user, class_name: "User"
    belongs_to :venue, class_name: "Venue"
end
