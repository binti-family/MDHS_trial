class Provider < ActiveRecord::Base
  scope :with_provider_type, -> (type) {
    return self if type.blank?

    where(provider_type: type)
  }

  scope :order_by_closest_to, -> (zipcode) {
    lat, lon = MS_ZIPCODES[zipcode.to_s].slice("lat", "long").values
    order(
      "providers.coordinates::geometry <-> "\
      "ST_SetSRID(ST_MakePoint(#{lon}, #{lat}), 4326)::geometry"
    )
  }

  def self.provider_types
    distinct(:provider_type).pluck(:provider_type)
  end

  def as_json(options = {})
    {
      id: id,
      name: name,
      age_range: age_range,
      capacity: capacity,
      city: city.capitalize,
      lat: MS_ZIPCODES[zipcode]["lat"],
      long: MS_ZIPCODES[zipcode]["long"],
      zipcode: zipcode,
      county_name: county_name,
      gender: gender,
      hours_of_operation: hours_of_operation,
      licensed: licensed,
      phone_number: phone_number,
      provider_type: provider_type,
      quality_rating: quality_rating,
    }
  end


end
