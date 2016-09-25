desc "Import csv file of seed providers"
task :import_providers => :environment do
  CSV.foreach("vendor/seed_data/Ms-Challenge-data.csv", headers: true) do |row, idx|
    p = Provider.create(
      name: row["ProviderName"],
      licensed: row["LicenseType"] == "LICENSED",
      provider_type: row["ProviderType"],
      quality_rating: row["QualityRating"],
      capacity: row["ProviderCapacity"],
      city: row["PhysicalCity"],
      zipcode: row["PhysicalZipcode"],
      county_name: row["County_name"],
      phone_number: row["PhoneNumber"]
    )

    if p.persisted?
      puts "Created #{p.name}'s record"
    else
      puts "Unable to create #{p.name}'s record, index: #{idx}"
    end

  end
end
