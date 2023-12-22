import 'package:country_flags/country_flags.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:supase_extension_form/extension/snack_bar.dart';
import 'package:supase_extension_form/models/address.dart';

class AddressCard extends StatefulWidget {
  const AddressCard({
    super.key,
    required this.address,
  });

  final Address address;

  @override
  State<AddressCard> createState() => _AddressCardState();
}

class _AddressCardState extends State<AddressCard> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox.square(
                  dimension: 30,
                  child: CountryFlag.fromCountryCode(widget.address.country.code),
                ),
                const Gap(8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Gap(4),
                    Text('${widget.address.country.name}, ${widget.address.state}'),
                    const Gap(8),
                    Text('${widget.address.other}, ${widget.address.street}'),
                    const Gap(8),
                    Text('${widget.address.city}, ${widget.address.zip}'),
                  ],
                ),
                const Spacer(),
                SizedBox.square(
                  dimension: 32,
                  child: isLoading
                      ? const CircularProgressIndicator()
                      : IconButton(
                          padding: EdgeInsets.zero,
                          onPressed: () {
                            _deleteAddress(context, id: widget.address.id!);
                          },
                          icon: const Icon(Icons.close),
                        ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _deleteAddress(
    BuildContext context, {
    required int id,
  }) async {
    try {
      setState(() {
        isLoading = true;
      });
      await Future.delayed(const Duration(seconds: 1));
      await Supabase.instance.client.from('addresses').delete().eq('id', id);
      setState(() {
        isLoading = false;
      });
    } catch (e) {
      if (!context.mounted) return;
      showErrorSnackBar(context: context, message: e.toString());
    }
  }
}
