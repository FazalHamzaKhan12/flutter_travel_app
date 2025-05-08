import 'package:flutter/material.dart';
import 'package:travelapp_ui/screens/bottom_nav/favorite_bottom_screen.dart';
import 'package:travelapp_ui/screens/bottom_nav/histroy_Bottom_screen.dart';
import 'package:travelapp_ui/screens/bottom_nav/profile_bottom_screen.dart';
import 'package:travelapp_ui/screens/home/homescreen.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _currentIndex = 0;

  final List screenList = [
    HomeScreen(),
    HistroyBottomScreen(),
    FavoriteBotmScreen(),
    ProfileBottomScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screenList[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_rounded),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.access_time),
            label: 'History',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            label: 'Favorite',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Mine',
          ),
        ],
      ),
    );
  }
}
