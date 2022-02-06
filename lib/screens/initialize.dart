import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wl_app/screens/home.dart';

class InitializeScreen extends StatefulWidget {
  const InitializeScreen({Key? key}) : super(key: key);

  @override
  _InitializeScreenState createState() => _InitializeScreenState();
}

class _InitializeScreenState extends State<InitializeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Text('enter your maxes:'),
            MaterialButton(
                onPressed: () => {_initializeApp()},
                child: Text('save your settings')
            )
          ],
        ),
      ),
    );
  }
  void _initializeApp() {
    SharedPreferences.getInstance().then((value) => {
      value.setBool('app_initialized', true)
    });
    print('app initialized');
    Navigator.pop(context);  // pop current page
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => Home(),
    ));
  }
}

