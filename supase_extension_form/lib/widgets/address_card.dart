import 'package:country_flags/country_flags.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:supase_extension_form/models/address.dart';

class AddressCard extends StatelessWidget {
  const AddressCard({
    super.key,
    required this.address,
  });

  final Address address;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SizedBox.square(
                  dimension: 30,
                  child: CountryFlag.fromCountryCode(address.country.code),
                ),
                const Gap(8),
                Text('${address.country.name}, ${address.state}'),
              ],
            ),
            const Gap(8),
            Text('${address.other}, ${address.street}'),
            const Gap(8),
            Text('${address.city}, ${address.zip}'),
          ],
        ),
      ),
    );
  }
}
