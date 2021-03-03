import 'package:flutter/material.dart';

import 'core/index.dart';
import 'ui/atom/index.dart';
import 'ui/molecule/index.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  int _counterCheck = 0;
  List<Behaviors> list = [
    Behaviors.SUCCESS,
    Behaviors.ERROR,
    Behaviors.INFO,
    Behaviors.WARNING,
  ];
  List<Behaviors> listCheckbox = [
    Behaviors.ACTIVE,
    Behaviors.INACTIVE,
  ];
  void _incrementCounter() {
    setState(() {
      ++_counter;
      _counter = (_counter <= 3) ? _counter : 0;
    });
  }

  void _incrementCounterCheck() {
    setState(() {
      ++_counterCheck;
      _counterCheck = (_counterCheck <= 1) ? _counterCheck : 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            InkWell(
              onTap: () {
                _incrementCounterCheck();
                setState(() {});
              },
              child: CheckboxRender(
                behaviours: listCheckbox[_counterCheck],
              ),
            ),
            IconRender(
              behaviors: list[_counter],
              data: 'texto de acessibilidade',
            ),
            TextRender(
              behaviors: list[_counter],
              data: 'Você apertou $_counter vez${_counter >= 1 ? 'es' : ''}',
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
