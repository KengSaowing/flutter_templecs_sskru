import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:temple/sarup.dart';
import 'package:temple/web%20broser.dart';
import 'admintemple.dart';
import 'json.dart';

class Launcher extends StatefulWidget {
  static const routeName = '/';

  @override
  State<StatefulWidget> createState() {
    return _LauncherState();
  }
}

class _LauncherState extends State<Launcher> {
  int _selectedIndex = 0;
  List<Widget> _pageWidget = <Widget>[

    Webbrowser(),
    Listview(),
    Webbrowser2(),
  ];
  List<BottomNavigationBarItem> _menuBar
  = <BottomNavigationBarItem>[
    BottomNavigationBarItem(
      icon: Icon(FontAwesomeIcons.home),
      title: Text('หน้าแรก'),
    ),
    BottomNavigationBarItem(
      icon: Icon(FontAwesomeIcons.list),
      title: Text('รายชื่อวัดทั้งหมด'),
    ),
    BottomNavigationBarItem(
      icon: Icon(FontAwesomeIcons.userCircle),
      title: Text('Admin'),
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: _pageWidget.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: _menuBar,
        currentIndex: _selectedIndex,
        selectedItemColor: Theme
            .of(context)
            .primaryColor,

        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
}