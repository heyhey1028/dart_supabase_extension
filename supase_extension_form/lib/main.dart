import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:supase_extension_form/screens/address_form_screen.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart'; // packageをインポート

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: '.env'); // .envファイルを読み込み
  final String anonKey = dotenv.env['SUPABASE_ANON'] ?? ''; // Anon keyを.envから取得
  final String projectUrl = dotenv.env['SUPABASE_URL'] ?? ''; // URLを.envから取得

  await Supabase.initialize(
    anonKey: anonKey, // プロジェクトAnon key
    url: projectUrl, // プロジェクトURL
  );
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
