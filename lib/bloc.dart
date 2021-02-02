import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:forgottenland/state.dart';
import 'package:rxdart/rxdart.dart';

class MainBloc extends ChangeNotifier {
  final _state = BehaviorSubject<MainState>();
  final _worlds = BehaviorSubject<List<String>>();
  final _selectedWorld = BehaviorSubject<String>();
  final _selectedSkill = BehaviorSubject<String>();
  final _highscores = BehaviorSubject<List<dynamic>>();

  /// BLOC STREAMS
  Stream<MainState> get streamState => _state.stream;
  Stream<List<String>> get streamWorlds => _worlds.stream;
  Stream<String> get streamSelectedWorld => _selectedWorld.stream;
  Stream<String> get streamSelectedSkill => _selectedSkill.stream;
  Stream<List<dynamic>> get streamHighscore => _highscores.stream;

  /// BLOC FUNCTIONS
  Function(String) get changeSelectedWorld => _selectedWorld.sink.add;
  Function(String) get changeSelectedSkill => _selectedSkill.sink.add;

  /// GETTERS
  List<dynamic> getHighscore() {
    return _highscores.value;
  }

  String getSkill() {
    return _selectedSkill.value;
  }

  /// REQUESTS
  Future<bool> loadWorlds() async {
    Dio dio = Dio();
    Response response;
    List<dynamic> _aux;
    try {
      dio.options.headers['content-Type'] = 'application/json';
      response = await dio.get(
        'https://api.tibiadata.com/v2/worlds.json',
      );

      _aux = response.data['worlds']['allworlds'];
      _worlds.value = [];
      _worlds.value.add('All Worlds');

      for (int i = 0; i < _aux.length; i++) {
        _worlds.value.add(_aux[i]['name']);
        print(_worlds.value[i]);
      }

      return true;
    } catch (e) {
      print(e);
    }
    return false;
  }

  Future<bool> loadHighscores() async {
    _state.add(MainState.LOADING);
    Dio dio = Dio();
    Response response;
    try {
      dio.options.headers['content-Type'] = 'application/json';
      if (_selectedWorld.value == null) {
        _selectedWorld.add('Antica');
      }
      if (_selectedSkill.value == null) {
        _selectedSkill.add('Level');
      }
      response = await dio.get(
        'https://api.tibiadata.com/v2/highscores/' +
            _selectedWorld.value +
            '/' +
            _selectedSkill.value +
            '/none.json',
      );
      _highscores.add(response.data['highscores']['data']);

      _state.add(MainState.DEFAULT);
      return true;
    } catch (e) {
      print(e);
    }

    _state.add(MainState.DEFAULT);
    return false;
  }

  @override
  void dispose() {
    _worlds.close();
    _selectedWorld.close();
    _selectedSkill.close();
    _highscores.close();
    super.dispose();
  }
}
