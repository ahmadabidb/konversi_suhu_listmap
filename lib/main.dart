import 'package:flutter/material.dart';
import 'package:konversi_suhu_flutter/widgets/convert.dart';
import 'package:konversi_suhu_flutter/widgets/input.dart';
import 'package:konversi_suhu_flutter/widgets/result.dart';
import 'package:konversi_suhu_flutter/widgets/dropdown.dart';
import 'package:konversi_suhu_flutter/widgets/riwayat.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Konversi Suhu'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController Celcius = new TextEditingController();

  double __inputUser = 0;
  double _kelvin = 0;
  double _reamur = 0;
  double _result = 0;
  String _newValue = "Kelvin";
  String changeValue = " ";
  final inputController = TextEditingController();

  var listItem = ["Kelvin", "Reamur"];
  List<String> listViewItem = <String>[];

  void konversiSuhu() {
    setState(() {
      __inputUser = double.parse(Celcius.text);
      if (_newValue == "Kelvin")
        _result = __inputUser + 273;
      else
        _result = __inputUser * (4 / 5);
      listViewItem.add(_newValue + " : " + _result.toString());
    });
  }

  void dropdownOnChanged(String changeValue) {
    setState(() {
      _newValue = changeValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("2041720120-Maulana Rosandy"),
        ),
        body: Container(
          margin: EdgeInsets.all(8),
          child: Column(children: [
            Input(Celcius: Celcius),
            Dropdown(
                dropdownOnChanged: dropdownOnChanged,
                changeValue: changeValue,
                listItem: listItem,
                newValue: _newValue,
                konversiSuhu: konversiSuhu),
            Result(result: _result),
            Container(
              margin: EdgeInsets.all(8),
              child: Text(
                "Riwayat Konversi",
                style: TextStyle(fontSize: 20),
              ),
            ),
            Expanded(
              child: RiwayatKonversi(listViewItem: listViewItem),
            ),
          ]),
        ),
      ),
    );
  }
}
