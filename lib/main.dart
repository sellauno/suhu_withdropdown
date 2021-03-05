import 'package:flutter/material.dart';
import 'input.dart';
import 'convert.dart';
import 'result.dart';
import 'dropdown.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override

  double _inputUser = 0;
  double _kelvin = 0;
  double _reamur = 0;
  final inputController = TextEditingController();
  String _newValue = "Kelvin";
  double _result = 0;

  List<String> listViewItem = [];

  void _konversiSuhu(){
    setState((){
      _inputUser = double.parse(inputController.text);
      if (_newValue == "Kelvin")
        _result = _inputUser + 273;
      else
        _result = (4 / 5) * _inputUser;
      listViewItem.add("$_newValue : $_result");
    });
  }

  RiwayatKonversi({List<String> listViewItem}) {
  listViewItem.map((String value) {
    return Container(
      margin: EdgeInsets.all(10),
       child: Text(
        value,
        style: TextStyle(fontSize: 15),
      )
    );
   }).toList();
  }

  void dropdownOnChanged(String changeValue){
    setState(() {
    _newValue = changeValue;
    _konversiSuhu();
    });
  }

  Widget build(BuildContext context) {

    var listItem = [
      "Kelvin",
      "Reamur"
    ];

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
      appBar: AppBar(
      title: Text("Konverter Suhu"),
      ),
      body: Container(
        margin: EdgeInsets.all(8),
        child: Column(
          children: [
            Input(inputController: inputController),
            DropdownKonversi(listItem: listItem, newValue: _newValue, dropdownOnChanged : dropdownOnChanged),
            Result(result: _result),
            Convert(konversiSuhu: _konversiSuhu),
            Container(
              margin: EdgeInsets.only(top: 10, bottom: 10),
              child: Text(
                "Riwayat Konversi",
                style: TextStyle(fontSize: 20),
              ),
            ),
            Expanded(
              child: RiwayatKonversi(listViewItem: listViewItem),
            ),
          ],
        ),
      ),
      ),
    );
  }
}



