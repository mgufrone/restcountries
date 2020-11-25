import 'dart:io';

import 'package:restcountries/restcountries.dart';

void main() async {
  var api = RestCountries.setup(Platform.environment['API_KEY']);
  List<Country> countries;
  List<Region> regions;
  List<City> cities;
  // get all countries
  countries = await api.getCountries();
  print(countries);
  // or you could do this as long as you have called setup for initialization
  countries = await RestCountries.instance.getCountries();
  print(countries);
  // search country functionality
  // you could also put city and/or region to narrow down the search of the country
  countries = await api.searchCountry(keyword: 'Indo', city: '', region: '');
  print(countries);

  // get all regions of a country. You need to pass the countryCode as it is required from the API
  regions = await api.getRegions(countryCode: 'id');
  print(regions);

  // search region
  regions =
      await api.searchRegion(countryCode: 'id', city: '', keyword: 'Jawa');
  print(regions);

  // you could get all cities by just filling the countryCode and region name.
  // if you want to narrow it down to search of some city, put the keyword as parameter
  cities = await api.getCities(
      countryCode: 'id', region: 'Jawa Timur', keyword: 'mal');
  print(cities);
}
