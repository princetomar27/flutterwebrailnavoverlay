import 'package:flutter/material.dart';
import '../webrailnavoverlay.dart';

class DashboardScreen extends StatefulWidget {
  final List<Widget> pages;
  final List<RailNavbarMenuItem> railNavbarMenuItemsList;

  const DashboardScreen({
    Key? key,
    required this.pages,
    required this.railNavbarMenuItemsList,
  }) : super(key: key);

  @override
  DashboardScreenState createState() => DashboardScreenState();
}

class DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
      ),
      backgroundColor: Colors.grey,
      body: Row(
        children: [
          RailNavBarWidget(
            selectedIndex: _selectedIndex,
            railNavbarMenuItemsList: widget.railNavbarMenuItemsList,
            onItemSelected: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
          ),
          Expanded(
            child: widget.pages[_selectedIndex],
          ),
        ],
      ),
      bottomNavigationBar: const DashboardFooterWidget(),
    );
  }
}
