import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Input extends StatelessWidget {
  const Input({
    Key key,
    @required this.inputController,
  }) : super(key: key);

  final Function dropdownOnChanged;
  final String newValue;
  final List listItem;

  @override
  Widget build(BuildContext context) {
    DropdownButton<String>(
              items:
              listItem.map((String value){
                return DropdownMenuItem<String>(
                value: value,
                child: Text(value),);
              }).toList(),
              value:  newValue,
              onChanged: dropdownOnChanged,
            ),
  }
}