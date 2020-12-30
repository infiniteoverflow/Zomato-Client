import 'package:flutter/material.dart';
import 'package:zomato_client/zomato_client.dart';

void main() {
  runApp(MyApp());
}

/// The basic BoilerPlate code used to represent a Material App
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: MyHomePage(title: 'Zomato API'),
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
  @override
  void initState() {
    super.initState();

    /// Creating object of the Zomato Class and we specify the api key as its parameter.
    Zomato zomato = Zomato(key: "<API Key>");

    /// Replace this code with any module you wish to test
    zomato.getCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
          child: Text(
        "Welcome to Zomato API",
        style: TextStyle(
          fontSize: 25,
        ),
      )),
    );
  }
}
