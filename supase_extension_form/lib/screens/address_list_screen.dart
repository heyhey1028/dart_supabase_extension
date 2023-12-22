import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:supase_extension_form/models/address.dart';
import 'package:supase_extension_form/widgets/address_card.dart';

class AddressListScreen extends StatelessWidget {
  const AddressListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Address List'),
      ),
      body: StreamBuilder<Object>(
        stream: getAddressStream(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          final addresses = snapshot.data as List<Address>;
          return ListView(
            padding: const EdgeInsets.all(16.0),
            children: [
              for (final address in addresses) AddressCard(address: address),
            ],
          );
        },
      ),
    );
  }

  Stream<List<Address>> getAddressStream() {
    return Supabase.instance.client.from('addresses').stream(
      primaryKey: ['id'],
    ).map((snapshot) {
      return snapshot.map(Address.fromJson).toList();
    });
  }
}
