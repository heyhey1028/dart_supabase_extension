import 'package:country_flags/country_flags.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:supase_extension_form/enum/country.dart';

var _countries = Country.values;

class AppDropdownField extends StatefulWidget {
  const AppDropdownField({super.key, required this.controller, required this.label});

  final TextEditingController controller;
  final String label;

  @override
  State<AppDropdownField> createState() => _AppDropdownFieldState();
}

class _AppDropdownFieldState extends State<AppDropdownField> {
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: InputDecorator(
        decoration: InputDecoration(
          errorStyle: const TextStyle(color: Colors.redAccent, fontSize: 16.0),
          hintText: 'Please select country',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
        ),
        isEmpty: widget.controller.text.isEmpty,
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            style: const TextStyle(color: Colors.black, fontSize: 16.0),
            isDense: true,
            value: widget.controller.text.isEmpty ? null : widget.controller.text,
            onChanged: (value) {
              setState(() {
                widget.controller.text = value!;
              });
            },
            items: _countries.map((Country country) {
              return DropdownMenuItem<String>(
                value: country.name,
                child: Row(mainAxisSize: MainAxisSize.min, children: [
                  SizedBox.square(
                    dimension: 30,
                    child: CountryFlag.fromCountryCode(country.code),
                  ),
                  const Gap(18),
                  Text(country.name),
                ]),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
