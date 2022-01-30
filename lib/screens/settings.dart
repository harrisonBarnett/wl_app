import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Settings extends StatelessWidget {
  // const Settings({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormBuilderState>();

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
                    'current squat max',
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 20),
                FormBuilderTextField(
                  name: 'snatch',
                  decoration: InputDecoration(
                    labelText:
                    'current snatch max',
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 20),
                FormBuilderTextField(
                  name: 'clean & jerk',
                  decoration: InputDecoration(
                    labelText:
                    'current c&j max',
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
      value.setBool('app_initialized', false)
    });
    print('app uninitialized');
  }
}
