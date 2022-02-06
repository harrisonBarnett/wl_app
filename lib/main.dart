import 'package:flutter/material.dart';
import 'package:wl_app/screens/home.dart';
import 'package:wl_app/screens/initialize.dart';
import 'package:shared_preferences/shared_preferences.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool appInitialized = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SharedPreferences.getInstance().then((response) => {
      setState(() => {
        appInitialized = response.getBool('app_initialized') ?? false,
      })
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'wl_',
      home: appInitialized ? Home() :InitializeScreen(),
    );
  }
}

