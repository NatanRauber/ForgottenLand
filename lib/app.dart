import 'package:flutter/material.dart';
import 'package:forgottenland/bloc.dart';
import 'package:forgottenland/state.dart';
import 'package:forgottenland/widgets/loading.dart';
import 'package:forgottenland/widgets/stream-dropdown-menu.dart';
import 'package:provider/provider.dart';

class AppScreen extends StatefulWidget {
  AppScreen({Key key}) : super(key: key);

  @override
  _AppScreenState createState() => _AppScreenState();
}

class _AppScreenState extends State<AppScreen> {
  Widget buildItem(BuildContext context, int index) {
    MainBloc _mainBloc = Provider.of<MainBloc>(context);

    return Card(
      margin: EdgeInsets.only(bottom: 5),
      child: Container(
        width: double.maxFinite,
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              _mainBloc.getHighscore() == null
                  ? ''
                  : (index + 1).toString() +
                      '. ' +
                      _mainBloc.getHighscore()[index]['name'],
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 5),
            Text(
              _mainBloc.getHighscore() == null
                  ? ''
                  : _mainBloc.getSkill() == 'Level'
                      ? 'Level: ' +
                          _mainBloc.getHighscore()[index]['level'].toString()
                      : 'Skill: ' +
                          _mainBloc.getHighscore()[index]['value'].toString(),
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    MainBloc _mainBloc = Provider.of<MainBloc>(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Forgotten Land'),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            StreamBuilder<List<String>>(
              stream: _mainBloc.streamWorlds,
              builder: (context, snapshot) {
                return streamDropdownMenu(
                  'World',
                  snapshot.data == null ? [] : snapshot.data,
                  _mainBloc.streamSelectedWorld,
                  _mainBloc.changeSelectedWorld,
                );
              },
            ),
            SizedBox(height: 15),
            streamDropdownMenu(
              'Skill',
              [
                'Level',
                'Magic',
                'Shielding',
                'Fist',
                'Distance',
                'Sword',
                'Axe',
                'Club',
                'Fishing'
              ],
              _mainBloc.streamSelectedSkill,
              _mainBloc.changeSelectedSkill,
            ),
            SizedBox(height: 15),
            RaisedButton(
              child: Text('Search'),
              onPressed: () {
                _mainBloc.loadHighscores();
              },
            ),
            SizedBox(height: 15),
            Flexible(
              child: RefreshIndicator(
                onRefresh: () async {
                  _mainBloc.loadHighscores();
                },
                child: StreamBuilder<MainState>(
                  stream: _mainBloc.streamState,
                  builder: (context, snapshot) {
                    return snapshot.data == null
                        ? Container()
                        : snapshot.data == MainState.LOADING
                            ? loadingWidget()
                            : ListView.builder(
                                padding: EdgeInsets.all(0),
                                itemCount: 100,
                                itemBuilder: buildItem,
                              );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
