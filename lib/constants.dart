import 'package:flutter/material.dart';

const kSendButtonTextStyle = TextStyle(
  color: Colors.lightBlueAccent,
  fontWeight: FontWeight.bold,
  fontSize: 18.0,
);

const kMessageTextFieldDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  hintText: 'Type your message here...',
  border: InputBorder.none,
);

const kMessageContainerDecoration = BoxDecoration(
  border: Border(
    top: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
  ),
);
const InputDecoration kTextFieldDecoration = InputDecoration(
  hintText: 'Enter Text',
  hintStyle: TextStyle(color: Colors.grey),
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(15.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.blueAccent, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(15.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.blueAccent, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(15.0)),
  ),
);

const Color kThemeColor = Color(0xffF55353);

List<String> Questions = [
  'Magnetic field lines emerge from (Easy)',
  '——————– is a closed-loop or path formed by the network of electrical components, where electrons flow.(Easy)',
  ' The force exerted on a current-carrying wire placed in a magnetic field is zero when the angle between the wire and the direction of the magnetic field is ——————.(Hard)',
  'Hydrocarbons are organic molecules that contain the element carbon.(Easy)',
  'What are Germanium hydrides called _____________(Medium)',
  ' Which of the following carbon allotropes is amorphous(Medium)?',
  'The position of a planet when it is nearest to the Sun is called(Easy)'
      'On which of the following planets of the solar system does the sun rise in the west and set in the east?(Medium)',
  'Which one of the following planets takes the same number of days for rotation and revolution?(Hard)',
  'The orbits of planets around the Sun, or of satellites around the Earth can be(Hard)'
];

List<String> A = [
  'South pole',
  'Electric Potential',
  '180 degree',
  'Hydrogen',
  'silanes',
  'Diamond',
  'Apogee',
  'Saturn',
  'Jupiter',
  'Circular and elliptic',
];

List<String> B = [
  'North Pole',
  'Electric Circuit',
  '45 degree',
  'Oxygen',
  'germanes',
  'Fullerenes',
  'Aphelion',
  'Mars',
  'Mars',
  'Parabolic and hyperbolic',
];

List<String> C = [
  'Center of magnet',
  'Electric Path',
  '90 degree',
  'Carbon',
  'stannum',
  'Graphite',
  'Perigee',
  'Jupiter',
  'Venus',
  'Elliptic and parabolic',
];

List<String> D = [
  'None of the option',
  'Electric Difference',
  '60 degree',
  'Both hydrogen and carbon',
  'plumbane',
  'Lampblack',
  'Perihelion',
  'Venus',
  'Mercury',
  'Circular and hyperbolic'
];

List<String> ans = [
  'B',
  'B',
  'A',
  'D',
  'B',
  'D',
  'D',
  'D',
  'D',
  'A',
];
