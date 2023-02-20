import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';

class MyAccountPage extends StatelessWidget {
  const MyAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const ProfileScreen(
      providerConfigs: [
        EmailProviderConfiguration(),
      ],
      avatarSize: 120,
      avatarShape: CircleBorder(),
    );
  }
}
