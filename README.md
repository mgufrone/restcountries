A library to get countries, state/region, and cities.

This library will help you out to get the ease of loading countries, state/regions, and cities from http://battuta.medunes.net.
So before you use this library, make sure you already have the API key obtained on the website. Once you have that, you shall use this library freely.
To obtain the key, you could visit http://battuta.medunes.net/ and request key.

## Usage

A simple usage example:

```dart
import 'package:restcountries/restcountries.dart';

main() async {
  var api = RestCountries.setup("YOUR_API_KEY");
  List<Country> countries = await api.getCountries();
  // see example for more details
}
```

## Functionality

| Use Case                                         | Supported |
|--------------------------------------------------|-----------|
| Get All Countries                                | Yes       |
| Get all regions based on country code            | Yes       |
| Get all cities based on regions and country code | Yes       |
| Search Country                                   | Yes       |
| Search region                                    | Yes       |
| Check Quota (http://battuta.medunes.net)         | Yes       |
| Get postal code                                  | No        |

## Features and bugs

Please file feature requests and bugs at the [issue tracker][tracker].

[tracker]: https://github.com/mgufrone/restcountries.git
