import 'package:flutter/material.dart';
import 'package:supase_extension_form/screens/address_form_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const AddressFormScreen(),
    );
  }
}
