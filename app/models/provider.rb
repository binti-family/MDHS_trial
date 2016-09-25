class Provider < ActiveRecord::Base
  scope :with_provider_type, -> (type) {
    return self if type.nil?

    where(provider_type: type)
  }

  scope :order_by_closest_to, -> (zipcode) {
    lat, lon = MS_ZIPCODES[zipcode.to_s].slice("lat", "long").values
    order(
      "providers.coordinates::geometry <-> "\
      "ST_SetSRID(ST_MakePoint(#{lon}, #{lat}), 4326)::geometry"
    )
  }

end
