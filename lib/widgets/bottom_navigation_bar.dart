import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../screens/favorites_screen.dart';
import '../screens/singers_screen.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  _BottomNavBar createState() => _BottomNavBar();
}

class _BottomNavBar extends State<BottomNavBar> {
  int _selectedIndex = 0;

  static final List<Widget> _pages = [SingersPage(), const FavoritesPage()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          mouseCursor: SystemMouseCursors.grab,
          unselectedIconTheme: const IconThemeData(size: 25),
          selectedFontSize: 18,
          unselectedFontSize: 16,
          selectedIconTheme:
              const IconThemeData(color: MEPrimaryColor, size: 30),
          selectedItemColor: MEPrimaryColor,
          unselectedItemColor: MEAcronymColor,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.list),
              label: 'Songs',
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite), label: 'Favorite'),
          ],
          currentIndex: _selectedIndex,
          onTap: (value) {
            setState(() {
              _selectedIndex = value;
            });
          },
        ),
        body: _pages.elementAt(_selectedIndex));
  }
}
