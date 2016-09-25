require 'csv'

MS_ZIPCODES = {}

# simple solution for a prototype, this object takes < 200KB
# for a production app, might store zipcode boundaries in a PostGIS instead

CSV.foreach("db/ms_zipcodes.csv", headers: true) do |row|
  MS_ZIPCODES[row["zipcode"]] = row.to_hash
end
