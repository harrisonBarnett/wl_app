import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Settings extends StatefulWidget {
  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  // const Settings({Key? key}) : super(key: key);

  // we will use this key to do bulk actions on form data
  final _formKey = GlobalKey<FormBuilderState>();

  bool appInitialized = false;
  double? squatMax;
  double? snatchMax;
  double? cleanJerkMax;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SharedPreferences.getInstance().then((response) => {
      setState((){
        appInitialized = response.getBool('app_initialized') ?? false;
        squatMax = response.getDouble('squat_max') ?? 315.0;
        snatchMax = response.getDouble('snatch_max') ?? 135.0;
        cleanJerkMax = response.getDouble('clean_jerk_max') ?? 225.0;
      })
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Settings'),
        backgroundColor: Colors.indigo,
      ),
      body: Column(
        children: <Widget>[
          FormBuilder(
            key: _formKey,
            child: Column(
              children: <Widget>[
                FormBuilderTextField(
                  name: 'squat',
                  decoration: InputDecoration(
                    labelText:
                    'current: ${squatMax}',
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 20),
                FormBuilderTextField(
                  name: 'snatch',
                  decoration: InputDecoration(
                    labelText:
                    'current: ${snatchMax}',
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 20),
                FormBuilderTextField(
                  name: 'clean & jerk',
                  decoration: InputDecoration(
                    labelText:
                    'current: ${cleanJerkMax}',
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: MaterialButton(
                  child: Text('submit'),
                  onPressed: () {
                    _formKey.currentState!.save();
                    print(_formKey.currentState!.value);
                  },
                ),
              ),
              Expanded(
                child: MaterialButton(
                  child: Text('reset'),
                  onPressed: ()  {
                    _formKey.currentState!.reset();
                  },
                ),
              ),
            ],
          ),
          MaterialButton(
              onPressed: () => {_uninitializeApp()},
          child: Text('Uninitialize app (TEST)')
          ),
        ],
      ),
    );
  }

  void _uninitializeApp() {
    SharedPreferences.getInstance().then((value) => {
      value.setBool('app_initialized', false),
      value.setDouble('squat_max', 0.0),
      value.setDouble('snatch_max', 0.0),
      value.setDouble('clean_jerk_max', 0.0),
    });
    print('app uninitialized');
  }
}
