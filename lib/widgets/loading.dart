import 'package:flutter/material.dart';
import 'package:forgottenland/theme.dart';

Widget loadingWidget() {
  return Center(
    child: CircularProgressIndicator(
      valueColor: AlwaysStoppedAnimation<Color>(appTheme().highlightColor),
    ),
  );
}
