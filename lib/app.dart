import 'package:flutter/material.dart';
import 'package:forgottenland/bloc.dart';
import 'package:forgottenland/widgets/loading.dart';
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
      color: Colors.grey[700],
      child: Container(
        width: double.maxFinite,
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              _mainBloc.getData()[index]['name'],
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            SizedBox(height: 5),
            Text(
              'level: ' + _mainBloc.getData()[index]['level'].toString(),
              style: TextStyle(color: Colors.grey[50], fontSize: 18),
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
        backgroundColor: Colors.grey[850],
        title: Text('Forgotten Land'),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.grey[900],
        child: RefreshIndicator(
          onRefresh: () async {
            _mainBloc.loadData();
          },
          child: StreamBuilder<List<dynamic>>(
            stream: _mainBloc.streamData,
            builder: (context, snapshot) {
              return snapshot.data == null
                  ? loadingWidget()
                  : ListView.builder(
                      padding: EdgeInsets.all(10),
                      itemCount: 100,
                      itemBuilder: buildItem,
                    );
            },
          ),
        ),
      ),
    );
  }
}
