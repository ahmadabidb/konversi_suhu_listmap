import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Dropdown extends StatelessWidget {
  const Dropdown(
      {Key? key,
      required this.listItem,
      required this.changeValue,
      required this.newValue,
      required this.dropdownOnChanged,
      required this.konversiSuhu})
      : super(key: key);
  final List<String> listItem;
  final changeValue;
  final newValue;
  final Function dropdownOnChanged;
  final Function konversiSuhu;
  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      items: listItem.map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      value: newValue,
      onChanged: (changeValue) {
        dropdownOnChanged(changeValue!);
        konversiSuhu();
      },
    );
  }
}
