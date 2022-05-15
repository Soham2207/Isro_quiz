import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:isro_quiz/constants.dart';
import 'dart:convert';
import 'package:isro_quiz/widgets/listTile.dart';

class SpaceCrafts extends StatefulWidget {
  @override
  State<SpaceCrafts> createState() => _SpaceCraftsState();
}

class _SpaceCraftsState extends State<SpaceCrafts> {
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
        await http.get(Uri.parse('http://isro.vercel.app/api/spacecrafts'));
    data = response.body.toString();
    setState(() {
      isSpinning = false;
    });
    print(data);
  }

  List<Widget> getItems() {
    List<Widget> items = [];
    for (int i = 1; i <= 112; i++) {
      String name = jsonDecode(data!)['spacecrafts'][i - 1]['name'].toString();
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
