import 'package:flutter/material.dart';
import 'package:ff_navigation_bar/ff_navigation_bar.dart';

class BottomNavBar extends StatefulWidget {
  BottomNavBar({Key key}) : super(key: key);

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    // FF Navigation Bar - Footer
    int selectedIndex = 0;

    return Scaffold(
      bottomNavigationBar: FFNavigationBar(
        theme: FFNavigationBarTheme(
          barBackgroundColor: Colors.white,
          selectedItemBorderColor: Colors.blueGrey[50],
          selectedItemBackgroundColor: Colors.blueAccent,
          selectedItemIconColor: Colors.white,
          selectedItemLabelColor: Colors.black,
        ),
        selectedIndex: selectedIndex,
        onSelectTab: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        items: [
          FFNavigationBarItem(
            iconData: Icons.child_care,
            label: 'Дети',
          ),
          FFNavigationBarItem(
            iconData: Icons.place,
            label: 'Места',
          ),
          FFNavigationBarItem(
            iconData: Icons.add_box,
            label: 'Добавить',
          ),
          FFNavigationBarItem(
            iconData: Icons.change_history,
            label: 'Сейчас',
          ),
          FFNavigationBarItem(
            iconData: Icons.settings,
            label: 'Настройки',
          ),
        ],
      ),
    );
  }
}
