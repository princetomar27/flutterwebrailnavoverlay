import 'package:flutter/material.dart';

class DashboardFooterWidget extends StatelessWidget {
  const DashboardFooterWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56.0,
      color: Colors.grey[200],
      child: const Center(
        child: Text('Dashboard Footer'),
      ),
    );
  }
}
