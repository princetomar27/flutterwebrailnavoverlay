import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Settings Page'),
    );
  }
}

class SettingsSubPage1 extends StatelessWidget {
  const SettingsSubPage1();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('Content for Sub-Settings 1')),
    );
  }
}

class SettingsSubPage2 extends StatelessWidget {
  const SettingsSubPage2();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('Content for Sub-Settings 2')),
    );
  }
}
