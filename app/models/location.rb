class Location < ApplicationRecord
  # has_many :location_paths  has_many :preloaded_stop_times, 
  has_many :parents, class_name: "LocationPath", primary_key: :uuid, foreign_key: :parent_id
  has_many :childs, class_name: "LocationPath", primary_key: :uuid, foreign_key: :parent_id


  belongs_to :location_type, foreign_key: :location_type_code, primary_key: :code

  before_save :add_uuid
  after_save :save_self_path

  def set_parent parent_id
    LocationPath.where(child_id: parent_id).find_each do |path|
      LocationPath.where({parent_id: path.parent_id, child_id: self.uuid}).first_or_create!
    end
  end

  private
  def add_uuid
    self.uuid = SecureRandom.uuid
  end

  def save_self_path
    LocationPath.where({parent_id: self.uuid, child_id: self.uuid}).first_or_create!
  end
end
