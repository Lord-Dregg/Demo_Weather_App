import 'package:flutter/material.dart';
import 'home.dart';

class Search extends StatefulWidget {
  State<StatefulWidget> createState() => SearchState();
}

class SearchState extends State<Search> {
  final TextEditingController _controller = TextEditingController();
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  String location = '';
  void Function(String)? updateText(value) {
    print(_controller.text);
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Home(value),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        TextField(
          controller: _controller,
          decoration: InputDecoration(
            hintText: 'Search City...',
            contentPadding: const EdgeInsets.all(10),
          ),
          textAlign: TextAlign.center,
          onSubmitted: (String value) {
            updateText(value);
          },
        ),
      ],
    );
  }
}
