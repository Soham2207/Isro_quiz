import 'dart:io';
import 'package:awesome_icons/awesome_icons.dart';
import 'package:flutter/material.dart';
import 'package:isro_quiz/constants.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';
import 'package:open_document/open_document.dart';

class Results extends StatelessWidget {
  Results({required this.UserAns});
  final List<String> UserAns;
  int easy = 0;
  int medium = 0;
  int hard = 0;

  int phy = 0;
  int chem = 0;
  int astr = 0;
  int marks = 0;

  void calculateResult() {
    for (int i = 0; i < ans.length; i++) {
      if (UserAns[i] == ans[i]) {
        marks += 4;
        if (i == 0 || i == 1 || i == 3 || i == 6)
          easy++;
        else if (i == 2 || i == 8 || i == 9)
          hard++;
        else
          medium++;
      }
      if (UserAns[i] == ans[i]) {
        if (i < 3)
          phy++;
        else if (i >= 3 && i < 6)
          chem++;
        else
          astr++;
      } else {
        marks -= 1;
      }
    }
  }

  void savepdf() async {
    final pdf = pw.Document();

    pdf.addPage(pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return pw.Center(
              child: pw.Column(
            children: [
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceEvenly,
                children: [
                  pw.Text(
                    'Marks:',
                    style: pw.TextStyle(fontSize: 15.0),
                  ),
                  pw.Text(
                    '$marks',
                    style: pw.TextStyle(fontSize: 15.0),
                  ),
                ],
              ),
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceEvenly,
                children: [
                  pw.Text(
                    'Easy:',
                    style: pw.TextStyle(fontSize: 15.0),
                  ),
                  pw.Text(
                    '$easy/3',
                    style: pw.TextStyle(fontSize: 15.0),
                  ),
                ],
              ),
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceEvenly,
                children: [
                  pw.Text(
                    'Medium:',
                    style: pw.TextStyle(fontSize: 15.0),
                  ),
                  pw.Text(
                    '$medium/3',
                    style: pw.TextStyle(fontSize: 15.0),
                  ),
                ],
              ),
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceEvenly,
                children: [
                  pw.Text(
                    'Hard:',
                    style: pw.TextStyle(fontSize: 15.0),
                  ),
                  pw.Text(
                    '$hard/4',
                    style: pw.TextStyle(fontSize: 15.0),
                  ),
                ],
              ),
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceEvenly,
                children: [
                  pw.Text(
                    'Physics:',
                    style: pw.TextStyle(fontSize: 15.0),
                  ),
                  pw.Text(
                    '$phy/3',
                    style: pw.TextStyle(fontSize: 15.0),
                  ),
                ],
              ),
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceEvenly,
                children: [
                  pw.Text(
                    'Chemistry:',
                    style: pw.TextStyle(fontSize: 15.0),
                  ),
                  pw.Text(
                    '$chem/3',
                    style: pw.TextStyle(fontSize: 15.0),
                  ),
                ],
              ),
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceEvenly,
                children: [
                  pw.Text(
                    'Astronomy:',
                    style: pw.TextStyle(fontSize: 15.0),
                  ),
                  pw.Text(
                    '$astr/4',
                    style: pw.TextStyle(fontSize: 15.0),
                  ),
                ],
              ),
            ],
          ));
        })); // Center

    final output = await getTemporaryDirectory();
    final file = File("${output.path}/example.pdf");
    await file.writeAsBytes(await pdf.save());
    await OpenDocument.openDocument(filePath: "${output.path}/example.pdf");
  }

  @override
  Widget build(BuildContext context) {
    calculateResult();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Result',
          style: TextStyle(color: Colors.white, fontSize: 20.0),
        ),
        backgroundColor: kThemeColor,
        actions: [
          TextButton.icon(
            icon: Icon(
              FontAwesomeIcons.backward,
              color: Colors.white,
            ),
            label: Text(
              'Back',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {
              Navigator.pop(context);
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(15.0),
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'Marks:',
                style: TextStyle(color: kThemeColor, fontSize: 15.0),
              ),
              Text(
                '$marks',
                style: TextStyle(fontSize: 15.0),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'Easy:',
                style: TextStyle(color: Colors.lightGreen, fontSize: 15.0),
              ),
              Text(
                '$easy/3',
                style: TextStyle(fontSize: 15.0),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'Medium:',
                style: TextStyle(color: Colors.amber, fontSize: 15.0),
              ),
              Text(
                '$medium/3',
                style: TextStyle(fontSize: 15.0),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'Hard:',
                style: TextStyle(color: Colors.red, fontSize: 15.0),
              ),
              Text(
                '$hard/4',
                style: TextStyle(fontSize: 15.0),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'Physics:',
                style: TextStyle(color: Colors.black, fontSize: 15.0),
              ),
              Text(
                '$phy/3',
                style: TextStyle(fontSize: 15.0),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'Chemistry:',
                style: TextStyle(color: Colors.black, fontSize: 15.0),
              ),
              Text(
                '$chem/3',
                style: TextStyle(fontSize: 15.0),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'Astronomy:',
                style: TextStyle(color: Colors.black, fontSize: 15.0),
              ),
              Text(
                '$astr/4',
                style: TextStyle(fontSize: 15.0),
              ),
            ],
          ),
          TextButton.icon(
            onPressed: () {
              savepdf();
            },
            icon: Icon(
              FontAwesomeIcons.print,
              color: Colors.white,
            ),
            label: Text(
              'Download',
              style: TextStyle(color: Colors.white, fontSize: 15.0),
            ),
            style: TextButton.styleFrom(backgroundColor: kThemeColor),
          )
        ]),
      ),
    );
  }
}
