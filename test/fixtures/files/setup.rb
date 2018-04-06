[
  {code: "country", name: "Country"}, 
  {code: "state", name: "State"}, 
  {code: "province", name: "Province"}, 
  {code: "nation", name: "Nation"}, 
  {code: "burough", name: "Burough"}, 
  {code: "city", name: "City"}, 
  {code: "town", name: "Town"}
].each { |row| LocationType.create(row)}

[
  {code: "IN", name: "India", location_type_code: "country"},
  {code: "US", name: "United States", location_type_code: "country"},
  {code: "IN-TN", name: "Tamil Nadu", location_type_code: "state"},
  {code: "IN-TN-CHNAI", name: "Chennai", location_type_code: "city"},
  {code: "IN-TN-MADUR", name: "Madurai", location_type_code: "city"},
  {code: "US-IL", name: "Illinois", location_type_code: "state"},
  {code: "US-SF", name: "San Francisco", location_type_code: "state"},
  {code: "US-SF-SNJSE", name: "San Jose", location_type_code: "city"}
].each { |row| Location.create(row)}


india = Location.find_by_code("IN")
us = Location.find_by_code("US")
Location.find_by_code("IN-TN").set_parent(india.uuid)
Location.find_by_code("IN-AP").set_parent(india.uuid)
Location.find_by_code("IN-TN-CHNAI").set_parent(Location.find_by_code("IN-TN").uuid)
Location.find_by_code("IN-TN-MADUR").set_parent(Location.find_by_code("IN-TN").uuid)
Location.find_by_code("US-IL").set_parent(us.uuid)
Location.find_by_code("US-SF").set_parent(us.uuid)
Location.find_by_code("US-SF-SNJSE").set_parent(Location.find_by_code("US-SF").uuid)


