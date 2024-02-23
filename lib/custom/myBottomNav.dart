import 'package:flutter/material.dart';

class MyBottomNav extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onTabTapped;
  const MyBottomNav(
      {super.key, required this.onTabTapped, required this.selectedIndex});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: selectedIndex,
      type: BottomNavigationBarType.fixed,
      unselectedItemColor: Colors.grey,
      selectedItemColor: Colors.amberAccent,
      onTap: onTabTapped,
      items: const [
        BottomNavigationBarItem(
            label: 'Home',
            icon: Icon(
              Icons.home_rounded,
            )),
        BottomNavigationBarItem(
            label: 'Catalog',
            icon: Icon(
              Icons.book_rounded,
            )),
        BottomNavigationBarItem(
            label: 'Cart',
            icon: Icon(
              Icons.shopping_cart,
            )),
        BottomNavigationBarItem(
            label: 'Profile',
            icon: Icon(
              Icons.person_pin,
            ))
      ],
      iconSize: 30,
    );
  }
}
