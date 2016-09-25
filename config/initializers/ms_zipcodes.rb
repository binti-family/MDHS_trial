MS_ZIPCODES = {}

CSV.foreach("db/ms_zipcodes.csv", header: true) do |row|
  MS_ZIPCODES[row["zipcode"]] = row
end
