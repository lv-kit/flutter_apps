import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:multi_image_picker/asset.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:flutter_camera_role_app/asset_view.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Asset> images = List<Asset>();
  String _error;

  @override
  void initState() {
    super.initState();
  }

  Widget buildGridView() {
    return GridView.count(
      crossAxisCount: 3,
      children: List.generate(images.length, (index) {
        return AssetView(index, images[index]);
      }),
    );
  }

  Future<void> loadAssets() async {
    setState(() {
      images = List<Asset>();
    });

    List resultList;
    String error;

    try {
      resultList = await MultiImagePicker.pickImages(
        maxImages: 300,
        enableCamera: true
      );
    } on PlatformException catch (e) {
      error = e.message;
    }

    if (!mounted) return;

    setState(() {
      images = resultList;
      if (error == null) _error = "No Error Detectedc";
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Column(
          children: <Widget>[
            Center(child: Text('Error: $_error')),
            RaisedButton(onPressed: loadAssets,
            child: Text("Pick images"),),
            Expanded(child: buildGridView())
          ],
        ),
      ),
    );
  }
}
