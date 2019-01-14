import 'package:flutter/material.dart';
import './examples/random_words.dart';
import './examples/layout_demo.dart';

void main() => runApp(MyApp());

final Map<String, WidgetBuilder> routes = {
  '/random_words': (BuildContext context) => RandomWords(),
  '/layout_demo': (BuildContext context) => LayoutDemo()
};

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Home(),
      routes: routes,
    );
  }
}

class Home extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter example'),
      ),
      body: ListView(
        children: _renderRoutesList(context),
      ),
    );
  }

  List<Widget> _renderRoutesList(BuildContext context) {
    final Iterable<ListTile> tiles = routes.entries.map((MapEntry entry) {
      return ListTile(
        title: Text(entry.key),
        onTap: () {
          Navigator.of(context).pushNamed(entry.key);
        },
      );
    });

    return ListTile.divideTiles(tiles: tiles, color: Colors.black12).toList();
  }
}
