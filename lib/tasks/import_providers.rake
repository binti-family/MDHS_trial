desc "Import csv file of seed providers"
task :import_providers => :environment do
  CSV.foreach("vendor/seed_data/Ms-Challenge-data.csv", headers: true) do |row, idx|
    p = Provider.create(
      name: row["ProviderName"],
      licensed: row["LicenseType"] == "LICENSED",
      provider_type: row["ProviderTypeDescription"],
      quality_rating: row["QualityRating"],
      capacity: row["ProviderCapacity"],
      city: row["PhysicalCity"],
      zipcode: row["PhysicalZipCode"],
      county_name: row["CountyName"],
      phone_number: row["PhoneNumber"],
      age_range: row["Age"],
      gender: row["Gender"],
      hours_of_operation: row["Hours of operation"]
    )

    if p.persisted?
      puts "Created #{p.name}'s record"
    else
      puts "Unable to create #{p.name}'s record, index: #{idx}"
    end

  end
end
