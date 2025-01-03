import 'package:flutter/material.dart';
import 'package:getx_prac/chart.dart';
import 'package:getx_prac/chart1.dart';
import 'package:getx_prac/chart2.dart';
import 'package:getx_prac/home.dart';
import 'package:getx_prac/toggleBtn.dart';

class BottomNavBarExample extends StatefulWidget {
  @override
  _BottomNavBarExampleState createState() => _BottomNavBarExampleState();
}

class _BottomNavBarExampleState extends State<BottomNavBarExample> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _screens = [
    // HomeScreen(),
    ToggleBtn(),
    LineChartSampleTwoLines(),
    BarChartSample2(),
    MonthlyIncomeChart(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color(0xFFEFFBF4), // Light green background
        selectedItemColor:
            Colors.green, // Highlight color for the selected icon
        unselectedItemColor: Colors.black54, // Color for unselected icons
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard_outlined),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.inventory_2_outlined),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_wallet_outlined),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt_outlined),
            label: '',
          ),
        ],
      ),
    );
  }
}
