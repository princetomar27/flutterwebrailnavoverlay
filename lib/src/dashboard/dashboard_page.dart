import 'package:flutter/material.dart';
import 'dashboard_footer_page.dart';
import '../rail_nav_bar/rail_nav_bar_menu_item.dart';
import '../rail_nav_bar/rail_nav_bar_menu_widget.dart';

class DashboardPage extends StatefulWidget {
  final List<Widget> pages;
  final List<RailNavbarMenuItem> railNavbarMenuItemsList;

  const DashboardPage({
    Key? key,
    required this.pages,
    required this.railNavbarMenuItemsList,
  }) : super(key: key);

  @override
  DashboardPageState createState() => DashboardPageState();
}

class DashboardPageState extends State<DashboardPage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final railNavbarMenuItemsList = widget.railNavbarMenuItemsList;
    final pages = widget.pages;

    int mainMenuSelectedIndex =
        _selectedIndex < railNavbarMenuItemsList.length ? _selectedIndex : 0;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
      ),
      backgroundColor: Colors.grey,
      body: Row(
        children: [
          RailNavBarWidget(
            selectedIndex: mainMenuSelectedIndex,
            railNavbarMenuItemsList: railNavbarMenuItemsList,
            onItemSelected: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
          ),
          Expanded(
            child: _selectedIndex < pages.length
                ? pages[_selectedIndex]
                : const SizedBox.shrink(),
          ),
        ],
      ),
      bottomNavigationBar: const DashboardFooterWidget(),
    );
  }
}
