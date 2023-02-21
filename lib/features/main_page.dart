import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MainPage extends StatelessWidget {
  const MainPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
}
