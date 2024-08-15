import 'package:flutter/material.dart';
import 'package:webrailnavoverlay/webrailnavoverlay.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DashboardPage(
        pages: [
          const HomePage(),
          const SettingsPage(),
          const SettingsSubPage1(),
          const SettingsSubPage2(),
        ],
        railNavbarMenuItemsList: [
          RailNavbarMenuItem(
            name: 'Home',
            iconPath: Icons.home,
            index: 0,
          ),
          RailNavbarMenuItem(
            name: 'Settings',
            iconPath: Icons.settings,
            index: 1,
            hoverItems: [
              HoverItemConfig(
                itemName: 'Sub-Settings 1',
                onTap: () {
                  // Handle sub-settings 1 tap
                },
                itemRoute: const SettingsSubPage1(),
              ),
              HoverItemConfig(
                itemName: 'Sub-Settings 2',
                onTap: () {
                  // Handle sub-settings 2 tap
                },
                itemRoute: const SettingsSubPage2(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
