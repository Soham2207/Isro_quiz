import 'package:flutter/material.dart';
import 'package:isro_quiz/constants.dart';
import 'package:awesome_icons/awesome_icons.dart';
import 'package:isro_quiz/screens/About/centres.dart';
import 'package:isro_quiz/screens/About/launchers.dart';
import 'package:isro_quiz/screens/About/satellites.dart';
import 'package:isro_quiz/screens/About/spacecrafts.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  List<Widget> _widgetOptions = <Widget>[
    SpaceCrafts(),
    Launcher(),
    Satellites(),
    Centres(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              FontAwesomeIcons.spaceShuttle,
            ),
            label: 'Spacecrafts',
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.rocket),
            label: 'Launchers',
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.satellite),
            label: 'Satellites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Centres',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: kThemeColor,
        onTap: _onItemTapped,
        unselectedItemColor: Colors.black,
        iconSize: 35.0,
      ),
    );
  }
}
