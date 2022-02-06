import 'package:flutter/material.dart';
import 'package:wl_app/components/navigation_drawer.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  double? squatMax;
  double? snatchMax;
  double? cleanJerkMax;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SharedPreferences.getInstance().then((response) => {
      setState(() => {
        squatMax = response.getDouble('squat_max') ?? 315.0,
        snatchMax = response.getDouble('snatch_max') ?? 135.0,
        cleanJerkMax = response.getDouble('clean_jerk_max') ?? 225.0
      })
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
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
                      Text(squatMax.toString())
                    ]
                  ),
                  Column(
                      children: [
                        Text('X'),
                        Text(snatchMax.toString())
                      ]
                  ),
                  Column(
                      children: [
                        Text('X'),
                        Text(cleanJerkMax.toString())
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

}

