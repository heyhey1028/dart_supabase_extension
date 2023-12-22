import 'package:supase_extension_form/models/country.dart';

class Address {
  final Country country;
  final String street;
  final String other;
  final String city;
  final String state;
  final String zip;

  Address({
    required this.country,
    required this.street,
    required this.other,
    required this.city,
    required this.state,
    required this.zip,
  });

  static Address get mock => Address(
        country: Country.us,
        street: '123 Street',
        other: 'Other',
        city: 'City',
        state: 'State',
        zip: '123456',
      );

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      country: Country.values.firstWhere(
        (country) => country.code == json['country_code'],
      ),
      street: json['street'],
      other: json['other'],
      city: json['city'],
      state: json['state'],
      zip: json['zipcode'],
    );
  }

  Map<String, dynamic> toJson() => {
        'country_code': country.code,
        'street': street,
        'other': other,
        'city': city,
        'state': state,
        'zip': zip,
      };
}
