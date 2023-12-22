import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    required this.controller,
    required this.label,
  });

  final TextEditingController controller;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          labelText: label,
        ),
        onTapOutside: (event) {
          final FocusScopeNode currentScope = FocusScope.of(context);
          if (!currentScope.hasPrimaryFocus && currentScope.hasFocus) {
            FocusManager.instance.primaryFocus!.unfocus();
          }
        },
      ),
    );
  }
}
