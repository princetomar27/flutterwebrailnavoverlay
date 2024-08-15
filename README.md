# WebRailNavOverlay

[![Pub Version](https://img.shields.io/pub/v/webrailnavoverlay)](https://pub.dev/packages/webrailnavoverlay)
[![License](https://img.shields.io/badge/license-MIT-blue.svg)](https://opensource.org/licenses/MIT)
[![Build Status](https://img.shields.io/github/actions/workflow/status/princetomar27/webrailnavoverlay/build.yml)](https://github.com/princetomar27/webrailnavoverlay/actions)

## Overview

`webrailnavoverlay` is a Flutter package designed to create a web-based dashboard with a navigation rail that supports overlay menus. It simplifies building responsive and customizable dashboards, ideal for admin panels, web apps, and more.

## Features

- **Customizable Dashboard**: Build and manage your web-based dashboards with ease.
- **Rail Navigation**: A sleek, vertical navigation rail with customizable items.
- **Overlay Hover Menus**: Add sub-menus that appear on hover, improving navigation.
- **Pre-built Pages**: Includes home and settings pages, along with sub-page templates.
- **Footer Support**: Integrate a footer to display additional controls or information.

## Getting Started

### Installation

Add `webrailnavoverlay` to your `pubspec.yaml` file:

```yaml
dependencies:
  webrailnavoverlay: ^0.0.1
```

Then, run `flutter pub get` to install the package.

### Usage

Import the package in your Dart file:

```dart
import 'package:webrailnavoverlay/webrailnavoverlay.dart';
```

### Example

Here’s a basic example of how to use `webrailnavoverlay` in your Flutter project:

```dart
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
```

### Customization

#### 1. **DashboardPage**

- **pages**: List of `Widget` to display for each menu item.
- **railNavbarMenuItemsList**: List of `RailNavbarMenuItem` for navigation.

#### 2. **RailNavbarMenuItem**

- **name**: The display name of the menu item.
- **iconPath**: The icon to display.
- **index**: The index of the item.
- **hoverItems**: (Optional) List of `HoverItemConfig` for sub-menus.

#### 3. **HoverItemConfig**

- **itemName**: The name of the sub-menu item.
- **onTap**: The action to perform on tap.
- **itemRoute**: The page to navigate to.

### Contributing

Contributions are welcome! If you have suggestions or find issues, please feel free to open an issue or submit a pull request on [GitHub](https://github.com/princetomar27/webrailnavoverlay).

### License

This project is licensed under the MIT License - see the [LICENSE](https://opensource.org/licenses/MIT) file for details.

### Acknowledgements

Special thanks to the Flutter community for their continuous support and contributions to the ecosystem.

---

**Note**: This package is under active development. Expect frequent updates and improvements.
