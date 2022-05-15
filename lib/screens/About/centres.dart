import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:isro_quiz/constants.dart';
import 'dart:convert';

import 'package:isro_quiz/widgets/LargeListTile.dart';

class Centres extends StatefulWidget {
  @override
  State<Centres> createState() => _CentresState();
}

class _CentresState extends State<Centres> {
  String? data;
  bool isSpinning = true;
  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  void getData() async {
    http.Response? response =
        await http.get(Uri.parse('http://isro.vercel.app/api/centres'));
    data = response.body.toString();
    setState(() {
      isSpinning = false;
    });
    print(data);
  }

  List<Widget> getItems() {
    List<Widget> items = [];
    for (int i = 1; i <= 44; i++) {
      String id = jsonDecode(data!)['centres'][i - 1]['id'].toString();
      String place = jsonDecode(data!)['centres'][i - 1]['Place'].toString();
      String name = jsonDecode(data!)['centres'][i - 1]['name'].toString();
      String State = jsonDecode(data!)['centres'][i - 1]['State'].toString();
      items.add(Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          LargeListtile(id: i.toString(), name: [
            'Id: $id',
            'Name: $name',
            'Place: $place',
            'State: $State',
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
