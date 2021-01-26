import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class MainBloc extends ChangeNotifier {
  final _data = BehaviorSubject<List<dynamic>>();

  Stream<List<dynamic>> get streamData => _data.stream;

  List<dynamic> getData() {
    return _data.value;
  }

  Future<bool> loadData() async {
    Dio dio = Dio();
    Response response;

    try {
      dio.options.headers['content-Type'] = 'application/json';

      response = await dio.get(
        'https://api.tibiadata.com/v2/highscores/calmera/level/none.json',
      );

      _data.add(response.data['highscores']['data']);

      print('loaded');
      return true;
    } catch (e) {
      print(e);
    }

    return false;
  }
}
