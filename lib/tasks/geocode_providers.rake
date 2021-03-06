desc "Geocode Providers in the database"

task :geocode_providers => :environment do
  Provider.where(coordinates: nil).each do |provider|
    geocode = Geocoder.search(provider.city, params: {
      county: provider.county_name,
      zipcode: provider.zipcode
    }).first

    if geocode
      puts "Successfully Geocoded #{provider.name} #{provider.id}"
      provider.coordinates = "POINT(#{geocode.longitude} #{geocode.latitude})"
      provider.save
    else
      puts "Unable to Geocod #{provider.name} #{provider.id}"
    end

    sleep 0.5 # Rate limit
  end
end
