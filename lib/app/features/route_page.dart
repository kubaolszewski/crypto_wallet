import 'package:crypto_wallet/app/features/main_page/main_page.dart';
import 'package:crypto_wallet/app/features/my_account_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RoutePage extends StatefulWidget {
  const RoutePage({super.key});

  @override
  State<RoutePage> createState() => _RoutePageState();
}

class _RoutePageState extends State<RoutePage> {
  var currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[600],
      appBar: AppBar(
        leading: const Icon(
          Icons.currency_bitcoin,
          color: Colors.white,
          size: 32,
        ),
        primary: true,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.green,
        title: Text(
          'My Crypto Wallet',
          style: GoogleFonts.righteous(
            color: Colors.white,
            fontSize: 24,
          ),
        ),
      ),
      body: Builder(
        builder: (context) {
          if (currentIndex == 0) {
            return const MainPage();
          }

          return const MyAccountPage();
        },
      ),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Colors.green[800],
          splashColor: null,
          textTheme: Theme.of(context).textTheme.copyWith(),
        ),
        child: BottomNavigationBar(
          currentIndex: currentIndex,
          selectedLabelStyle: GoogleFonts.righteous(fontSize: 16),
          unselectedLabelStyle: GoogleFonts.righteous(fontSize: 16),
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.white,
          onTap: (newIndex) {
            setState(() {
              currentIndex = newIndex;
            });
          },
          items: const [
            BottomNavigationBarItem(
              backgroundColor: Colors.white,
              icon: Icon(
                Icons.currency_exchange,
                size: 32,
              ),
              label: 'Currencies',
            ),
            BottomNavigationBarItem(
              backgroundColor: Colors.white,
              icon: Icon(
                Icons.person,
                size: 32,
              ),
              label: 'My account',
            ),
          ],
        ),
      ),
    );
  }
}
