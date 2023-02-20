import 'package:crypto_wallet/auth/pages/my_account_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[600],
      body: Builder(
        builder: (context) {
          if (currentIndex == 0) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Hello :)',
                    style: GoogleFonts.righteous(
                      color: Colors.white,
                      fontSize: 32,
                    ),
                  )
                ],
              ),
            );
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
                Icons.home,
                size: 32,
              ),
              label: 'Home',
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
