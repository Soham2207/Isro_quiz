import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:isro_quiz/constants.dart';
import 'dart:convert';

import 'package:isro_quiz/widgets/LargeListTile.dart';

class Satellites extends StatefulWidget {
  @override
  State<Satellites> createState() => _SatellitesState();
}

class _SatellitesState extends State<Satellites> {
  String? data;
  bool isSpinning = true;
  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  void getData() async {
    http.Response? response = await http
        .get(Uri.parse('http://isro.vercel.app/api/customer_satellites'));
    data = response.body.toString();
    setState(() {
      isSpinning = false;
    });
    print(data);
  }

  List<Widget> getItems() {
    List<Widget> items = [];
    for (int i = 1; i <= 53; i++) {
      String id =
          jsonDecode(data!)['customer_satellites'][i - 1]['id'].toString();
      String country =
          jsonDecode(data!)['customer_satellites'][i - 1]['country'].toString();
      String launch_date = jsonDecode(data!)['customer_satellites'][i - 1]
              ['launch_date']
          .toString();
      String mass =
          jsonDecode(data!)['customer_satellites'][i - 1]['mass'].toString();
      String launcher = jsonDecode(data!)['customer_satellites'][i - 1]
              ['launcher']
          .toString();
      items.add(Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          LargeListtile(id: i.toString(), name: [
            'Id: $id',
            'Country: $country',
            'Launch Date: $launch_date',
            'Mass: $mass',
            'Launcher: $launcher'
          ]),
          SizedBox(
            height: 5.0,
          ),
        ],
      ));
    }
    return items;
  }

  Widget build(BuildContext context) {
    return isSpinning
        ? CircularProgressIndicator(
            color: kThemeColor,
          )
        : Padding(
            padding: const EdgeInsets.all(12.0),
            child: ListView(
              children: getItems(),
            ),
          );
  }
}
