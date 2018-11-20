import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: "page navigation",
    home: FirstScreen(),
  ));
}


class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("First Screen"),
      ),
      body: Center(
        child: RaisedButton(
          child: Text("Launch Screen"),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SecondScreen())
            );
          },
          color: Colors.limeAccent,
        ),
      ),
    );
  }
}


class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Screen"),
      ),
      body: Center(
        child: RaisedButton(
            child: Text("Go back"),
            onPressed: () {
              Navigator.pop(context);
            },
            color: Colors.yellowAccent,
        ),
      ),
    );
  }
}