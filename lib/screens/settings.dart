import 'package:flutter/material.dart';
import './drawer_menu_widget.dart';

class SettingsPage extends StatelessWidget{
  final VoidCallback openDrawer;

  const SettingsPage({
    Key? key,
    required this.openDrawer,
  }) :super(key: key);
  @override 
  Widget build(BuildContext context)=>Scaffold(
    backgroundColor: Colors.transparent,
    appBar: AppBar(
      backgroundColor: Colors.transparent,
      leading: DrawerMenuWidget( onClicked: openDrawer),
      title: Text('SettingsPage'),
    ),
     body: const Center(
        child: Text(
          'Settings Page',
        style: TextStyle(
          fontSize: 40,
        )
  )));
}