import 'package:flutter/material.dart';
import 'package:wl_app/screens/settings.dart';

class NavigationDrawer extends StatelessWidget {

  final padding = EdgeInsets.symmetric(horizontal: 20);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Material(
            color: Colors.indigo,
            child: ListView(
                children: <Widget>[
                  const SizedBox(height: 20),
                  _buildMenuItem(
                    text: 'Options',
                    icon: Icons.settings,
                    onClicked: () => _selectedItem(context, 0),
                  ),
                  const SizedBox(height: 20),
                  _buildMenuItem(
                    text: 'Stats',
                    icon: Icons.bar_chart,
                    onClicked: () => _selectedItem(context, 1),
                  ),
                  const SizedBox(height: 20),
                  _buildMenuItem(
                    text: 'Journal',
                    icon: Icons.book,
                    onClicked: () => _selectedItem(context, 2),
                  ),
                  const SizedBox(height: 20),
                  Divider(color: Colors.white),
                  const SizedBox(height: 20),
                ]
            )
        )
    );
  }
  Widget _buildMenuItem({required String text, required IconData icon, VoidCallback? onClicked,}) {
    final color = Colors.white;

    return ListTile(
        leading: Icon(icon, color: color),
        title: Text(text, style: TextStyle(color: color)),
        onTap: onClicked
    );
  }

  void _selectedItem(BuildContext context, int index) {
    Navigator.of(context).pop();

    switch(index) {
      case 0:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => Settings(),
        ));
        break;
      case 1:
        print('selecting statistics page');
        break;
      case 2:
        print('selectintg journal page');
        break;
    }
  }
}