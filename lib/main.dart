import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "My App",
      home: HomePage(),
      theme: ThemeData(
          primarySwatch: Colors.green,
          accentColor: Colors.red,
          brightness: Brightness.dark),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String myText = "Hello World";

  void _changeText() {
    setState(() {
      if (myText.startsWith("H")) {
        myText = "Welcome to My App";
      } else {
        myText = "Hello World";
      }
    });
  }

  Widget _bodyWidget() {
    return new Container(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(
              myText,
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.message),
              tooltip: "Message Send",
              onPressed: () {},
            ),
            title: Text("Home Page"),
            centerTitle: true,
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.settings),
                tooltip: 'Show Action Button',
                color: Colors.white,
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Setting Button click ")));
                },
              ),
              IconButton(
                icon: Icon(Icons.share),
                tooltip: 'Show Action Button',
                color: Colors.white,
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Share Button click ")));
                },
              )
            ],
          ),
          body: _bodyWidget(),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: _changeText,
        ),
      ),
    );
  }
}
