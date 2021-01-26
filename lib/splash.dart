import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:forgottenland/app.dart';
import 'package:forgottenland/bloc.dart';
import 'package:provider/provider.dart';
import 'package:splashscreen/splashscreen.dart';

class SplashSoftScreen extends StatefulWidget {
  SplashSoftScreen({Key key, this.text}) : super(key: key);
  final String text;

  @override
  _SplashSoftScreenState createState() => _SplashSoftScreenState();
}

class _SplashSoftScreenState extends State<SplashSoftScreen> {
  @override
  void initState() {
    super.initState();

    /// transparent status bar
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    MainBloc _mainBloc = Provider.of<MainBloc>(context);

    _mainBloc.loadData();

    return SplashScreen(
      routeName: '/',
      seconds: 2,
      image: Image.asset('assets/logo.jpg'),
      photoSize: 130,
      backgroundColor: Colors.black,
      loaderColor: Colors.white,
      navigateAfterSeconds: AppScreen(),
    );
  }
}
