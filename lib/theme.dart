import 'package:flutter/material.dart';

ThemeData appTheme() {
  return ThemeData(
    brightness: Brightness.dark,

    /// primary color pallete
    primaryColor: Color(0xff4285F4),

    /// highlight color
    highlightColor: Color(0xffF4B400),

    /// accent color
    accentColor: Color(0xffF4B400),

    /// main background color
    backgroundColor: Colors.grey[900],
    scaffoldBackgroundColor: Colors.grey[900],

    /// disabled items color
    disabledColor: Colors.grey[300],

    /// error color
    errorColor: Color(0xffDB4437),

    /// main buttons theme
    buttonTheme: ButtonThemeData(
      textTheme: ButtonTextTheme.primary,
      buttonColor: Color(0xff4285F4),
      height: 50,
      minWidth: double.maxFinite,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
    ),

    /// text theme
    textTheme: TextTheme(
      bodyText2: TextStyle(
        fontSize: 15,
      ),
      button: TextStyle(
        fontSize: 16,
      ),
    ),

    /// icons theme
    // iconTheme: IconThemeData(color: Colors.grey[800]),

    /// text inputs theme
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.grey[100],
      hintStyle: TextStyle(color: Colors.grey),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide(color: Color(0xff4285F4), width: 1),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide(color: Color(0xff4285F4), width: 1),
      ),
    ),

    /// card theme
    cardTheme: CardTheme(
      color: Colors.grey[850],
      margin: EdgeInsets.all(0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    ),

    /// dialog theme
    dialogTheme: DialogTheme(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    ),

    /// app bar theme
    appBarTheme: AppBarTheme(
      brightness: Brightness.dark,
      color: Colors.grey[850],
    ),

    /// bottom navigation bar theme
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.shifting,
      backgroundColor: Color(0xffffffff),
      showSelectedLabels: false,
      showUnselectedLabels: false,
      selectedItemColor: Color(0xffabd517),
      unselectedItemColor: Colors.white70,
      selectedIconTheme:
          IconThemeData(color: Colors.white, size: 23, opacity: 1),
      unselectedIconTheme:
          IconThemeData(color: Colors.white, size: 23, opacity: 0.5),
    ),

    /// snack bar theme
    snackBarTheme: SnackBarThemeData(
      backgroundColor: Color(0xff971417),
      contentTextStyle: TextStyle(color: Colors.white),
    ),
  );
}
