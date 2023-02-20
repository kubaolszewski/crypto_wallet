import 'package:crypto_wallet/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const CryptoWallet());
}

class CryptoWallet extends StatelessWidget {
  const CryptoWallet({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Crypto Wallet',
      debugShowCheckedModeBanner: false,
      theme: getThemeData(),
      home: const WelcomePage(),
    );
  }

  ThemeData getThemeData() {
    return ThemeData(
      useMaterial3: true,
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.purple),
          foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all<Color>(Colors.purple),
        ),
      ),
    );
  }
}
