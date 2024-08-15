## 0.0.3

Initial Release
This version marks the initial release of the webrailnavoverlay package, a Flutter package designed to simplify the creation of web-based navigation dashboards with an intuitive rail navigation bar and overlay support. Below are the key features and functionalities introduced in this version:

Features
Dashboard Page:

A customizable DashboardPage widget that serves as the main screen for your web application.
Supports dynamic content by accepting a list of pages (List<Widget>) that are rendered based on the selected navigation item.
Integrated with a responsive layout that adapts to different screen sizes.
Rail Navigation Bar:

RailNavbarMenuItem Class:
Represents an individual item in the navigation rail.
Supports icons, labels, and indexing for seamless navigation.
Optional hover items (List<HoverItemConfig>) to display sub-menu items on hover, improving the user experience.
RailNavBarWidget:
A vertical navigation bar widget that integrates seamlessly with the DashboardPage.
Handles item selection and displays an overlay for sub-items on hover.
Overlay Hover Support:

Customizable hover behavior for navigation items, enabling the display of sub-items.
Easily managed through the HoverItemConfig class, which defines the hover items and their actions.
Pre-built Pages:

HomePage: A basic home page to get started quickly.
SettingsPage: A settings page template with placeholders for sub-pages.
SettingsSubPage1 and SettingsSubPage2: Examples of sub-pages that can be accessed via the settings menu.
Footer Integration:

A customizable DashboardFooterWidget to display additional information or controls at the bottom of the dashboard.
Documentation and Examples
Comprehensive documentation is provided to guide users through the setup and customization process.
An example implementation is included in the package to demonstrate how to use the DashboardPage, RailNavBarWidget, and related components effectively.
Bug Fixes
N/A (Initial release)
Known Issues
N/A (Initial release)

How to Upgrade
To start using webrailnavoverlay in your project, simply add it to your pubspec.yaml:

yaml
dependencies:
webrailnavoverlay: ^0.0.2

Then, import it into your Dart files:

dart
import 'package:webrailnavoverlay/webrailnavoverlay.dart';
