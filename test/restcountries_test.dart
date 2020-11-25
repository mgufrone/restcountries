import 'package:mockito/mockito.dart';
import 'package:restcountries/restcountries.dart';
import 'package:test/test.dart';

class MockRestCountries extends Mock implements RestCountries {}

void main() {
  group('Initial test with empty key', () {
    test('Initiate class with null value', () {
      expect(() => RestCountries.setup(null),
          throwsA(TypeMatcher<AssertionError>()));
    });
    test('Initiate class with empty value', () {
      expect(() => RestCountries.setup(''),
          throwsA(TypeMatcher<AssertionError>()));
    });
  });
  group('Real Test', () {
    RestCountries api;
    setUpAll(() {
      api = RestCountries.setup('f24f0077c8f07a5ff488cb9f844d4f14');
    });

    test('get countries', () async {
      final countries = await api.getCountries();
      expect(countries.length, greaterThan(0));
      expect(countries.first is Country, equals(true));
    });
  });
}
