import 'package:flutter/material.dart';
import './search_screen.dart';

main(List<String> args) {
  runApp(App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      theme: ThemeData(
        fontFamily: 'Cooper',
      ),
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Demo Weather API App',
            style: TextStyle(
              fontSize: 14.0,
            ),
          ),
          backgroundColor: Color.fromRGBO(0, 0, 204, 1),
          foregroundColor: Colors.white,
          //toolbarHeight: (5 / 100) * MediaQuery.of(context).size.height,
        ),
        backgroundColor: Color.fromRGBO(230, 230, 255, 1),
        body: Search(),
      ),
    );
  }
}
