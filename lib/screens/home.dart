import 'package:flutter/material.dart';
import 'package:wl_app/components/navigation_drawer.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  bool appInitialized = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SharedPreferences.getInstance().then((value) => {
      setState(() => {
        appInitialized = value.getBool('app_initialized') ?? false
      })
    });
  }

  @override
  Widget build(BuildContext context) {

    return appInitialized == false ?
    // render setup screen if app has not been initialized
    Scaffold(
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
    ) :
    // render main screen if app has been initialized
    Scaffold(
      drawer: NavigationDrawer(),
      appBar: AppBar(
        title: Text('Home'),
        backgroundColor: Colors.indigo,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            Text('_maxes'),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    children: [
                      Text('X'),
                      Text('405')
                    ]
                  ),
                  Column(
                      children: [
                        Text('X'),
                        Text('225')
                      ]
                  ),
                  Column(
                      children: [
                        Text('X'),
                        Text('315')
                      ]
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
                onPressed: () => {},
                child: ListTile(
                  leading: Icon(Icons.circle_rounded),
                  title: Text('SQUAT')
                ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => {},
              child: ListTile(
                  leading: Icon(Icons.square_foot),
                  title: Text('SNATCH')
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => {},
              child: ListTile(
                  leading: Icon(Icons.person),
                  title: Text('CLEAN & JERK')
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => {},
              child: ListTile(
                  leading: Icon(Icons.car_repair),
                  title: Text('TEST')
              ),
            ),
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
  }
}

