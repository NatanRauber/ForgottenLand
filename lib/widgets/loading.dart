import 'package:flutter/material.dart';

Widget loadingWidget() {
  return Center(
    child: CircularProgressIndicator(
      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
    ),
  );
}
