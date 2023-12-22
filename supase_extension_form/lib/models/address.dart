import 'package:supase_extension_form/models/country.dart';

class Address {
  final int? id;
  final Country country;
  final String street;
  final String other;
  final String city;
  final String state;
  final String zip;

  Address({
    this.id,
    required this.country,
    required this.street,
    required this.other,
    required this.city,
    required this.state,
    required this.zip,
  });

  static Address get mock => Address(
        id: 0,
        country: Country.us,
        street: '123 Street',
        other: 'Other',
        city: 'City',
        state: 'State',
        zip: '123456',
      );

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      id: json['id'],
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
        'id': id,
        'country_code': country.code,
        'street': street,
        'other': other,
        'city': city,
        'state': state,
        'zip': zip,
      };
}
