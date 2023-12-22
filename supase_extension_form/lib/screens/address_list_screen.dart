import 'package:flutter/material.dart';

class AddressListScreen extends StatelessWidget {
  const AddressListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Address'),
      ),
      body: const Center(
        child: Text('Address List'),
      ),
    );
  }
}
