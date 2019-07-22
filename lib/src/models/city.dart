
class City {

  String city;
  String region;
  String country;
  String latitude;
  String longitude;

	City.fromJsonMap(Map<String, dynamic> map): 
		city = map["city"],
		region = map["region"],
		country = map["country"],
		latitude = map["latitude"],
		longitude = map["longitude"];

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['city'] = city;
		data['region'] = region;
		data['country'] = country;
		data['latitude'] = latitude;
		data['longitude'] = longitude;
		return data;
	}
}
