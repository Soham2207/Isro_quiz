import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:isro_quiz/constants.dart';
import 'dart:convert';
import 'package:isro_quiz/widgets/listTile.dart';

class Launcher extends StatefulWidget {
  @override
  State<Launcher> createState() => _LauncherState();
}

class _LauncherState extends State<Launcher> {
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
        await http.get(Uri.parse('http://isro.vercel.app/api/launchers'));
    data = response.body.toString();
    setState(() {
      isSpinning = false;
    });
    print(data);
  }

  List<Widget> getItems() {
    List<Widget> items = [];
    for (int i = 1; i <= 81; i++) {
      String name = jsonDecode(data!)['launchers'][i - 1]['id'].toString();
      items.add(Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Listtile(id: i.toString(), name: ['$i. $name']),
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
