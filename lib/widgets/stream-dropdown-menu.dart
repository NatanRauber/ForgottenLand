import 'package:flutter/material.dart';
import 'package:forgottenland/theme.dart';

Widget streamDropdownMenu(
  String hintText,
  List<String> options,
  Stream stream,
  Function function,
) {
  return StreamBuilder<String>(
    stream: stream,
    builder: (context, snapshot) {
      return Container(
        padding: EdgeInsets.only(left: 11, right: 10),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: appTheme().cardTheme.color,
          borderRadius: BorderRadius.circular(15),
        ),
        child: DropdownButtonHideUnderline(
          child: DropdownButton(
            hint: Text(hintText),
            value: snapshot.data,
            onChanged: function,
            items: options.map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ),
      );
    },
  );
}
