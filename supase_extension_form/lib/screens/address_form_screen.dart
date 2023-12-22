import 'package:flutter/material.dart';
import 'package:supase_extension_form/widgets/app_dropdown_field.dart';
import 'package:supase_extension_form/widgets/app_text_field.dart';
import 'package:gap/gap.dart';

class AddressFormScreen extends StatefulWidget {
  const AddressFormScreen({super.key});

  @override
  State<AddressFormScreen> createState() => _AddressFormScreenState();
}

class _AddressFormScreenState extends State<AddressFormScreen> {
  final countryController = TextEditingController();
  final streetController = TextEditingController();
  final otherController = TextEditingController();
  final cityController = TextEditingController();
  final stateController = TextEditingController();
  final zipController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Address'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Gap(16),
            const Text(
              'Delivery Information',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            const Gap(32),
            AppDropdownField(controller: countryController, label: 'Country'),
            const Gap(32),
            AppTextField(controller: streetController, label: 'Street Address'),
            const Gap(32),
            AppTextField(controller: otherController, label: 'Apt, Suite, etc.'),
            const Gap(32),
            AppTextField(controller: cityController, label: 'City'),
            const Gap(32),
            Row(
              children: [
                AppTextField(controller: stateController, label: 'State'),
                const Gap(16),
                AppTextField(controller: zipController, label: 'Zip code'),
              ],
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        height: 80,
        // stadium border button
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: const StadiumBorder(),
            ),
            onPressed: () {},
            child: const Text(
              'Register address',
            ),
          ),
        ),
      ),
    );
  }
}
