import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:restcountries/src/models/models.dart';

class RestCountries {
  static RestCountries instance;
  String key;
  Dio client;
  RestCountries({this.key})
      : assert(key != null && key != ""),
        client = Dio(BaseOptions(
            queryParameters: {'key': key},
            baseUrl: 'http://battuta.medunes.net/api'));
  static RestCountries setup(String key) {
    instance = RestCountries(key: key);
    return instance;
  }

  Future<int> checkQuota() async {
    var response = await client.get("quota");
    return response.data["remaining quota"];
  }

  Future<List<dynamic>> _get(String path,
      {Map<String, String> parameters}) async {
    var response = await client.get(path, queryParameters: parameters);
    return response.data as List<dynamic>;
  }

  Future<List<Country>> getCountries() async {
    return (await _get("/country/all"))
        .map((data) => Country.fromJsonMap(data))
        .toList();
  }

  Future<List<Country>> searchCountry(
      {String keyword, String city, String region}) async {
    assert(keyword.isNotEmpty ||
        (keyword.isEmpty && (city.isNotEmpty || region.isNotEmpty)));
    Map<String, String> params = {};
    if (keyword.isNotEmpty) {
      params['country'] = keyword;
    }
    if (region.isNotEmpty) {
      params['region'] = region;
    }
    if (city.isNotEmpty) {
      params['city'] = city;
    }
    return (await _get("/country/search", parameters: params))
        .map((data) => Country.fromJsonMap(data))
        .toList();
  }

  Future<List<Region>> getRegions({@required String countryCode}) async {
    return (await _get("/region/$countryCode/all"))
        .map((data) => Region.fromJsonMap(data))
        .toList();
  }

  Future<List<Region>> searchRegion(
      {String keyword, String city, @required String countryCode}) async {
    Map<String, String> params = {};
    if (keyword.isNotEmpty) {
      params['region'] = keyword;
    }
    if (city.isNotEmpty) {
      params['city'] = city;
    }
    assert(params.isNotEmpty);
    return (await _get("/$countryCode/region/search", parameters: params))
        .map((data) => Region.fromJsonMap(data))
        .toList();
  }

  Future<List<City>> getCities(
      {@required String countryCode, String region, String keyword}) async {
    assert(region.isNotEmpty || keyword.isNotEmpty);
    Map<String, String> params;
    if (keyword.isNotEmpty) {
      params['city'] = keyword;
    }
    if (region.isNotEmpty) {
      params['region'] = region;
    }
    return (await _get("/city/$countryCode/search", parameters: params))
        .map((data) => City.fromJsonMap(data))
        .toList();
  }
}
