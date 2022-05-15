import 'package:flutter/material.dart';
import 'package:isro_quiz/constants.dart';

class Listtile extends StatelessWidget {
  Listtile({required this.id, required this.name});
  final String id;
  final List<String> name;

  List<Text> getitems() {
    List<Text> items = [];
    for (var i in name) {
      var newitem = Text(
        i,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w900,
          fontStyle: FontStyle.italic,
          fontSize: 20,
        ),
      );
      items.add(newitem);
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: kThemeColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12.0),
          topRight: Radius.circular(12.0),
          bottomLeft: Radius.circular(12.0),
          bottomRight: Radius.circular(12.0),
        ),
      ),
      padding: EdgeInsets.all(12.0),
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: getitems(),
      )),
      height: 100.0,
    );
  }
}
