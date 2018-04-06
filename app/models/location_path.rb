class LocationPath < ApplicationRecord
  belongs_to :location, primary_key: :uuid, foreign_key: :parent_id, class_name: "Location"
  belongs_to :location, primary_key: :uuid, foreign_key: :child_id, class_name: "Location"


  validates :parent_id, uniqueness: { scope: [:child_id] }
  
end
