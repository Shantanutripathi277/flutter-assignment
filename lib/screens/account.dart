import 'package:flutter/material.dart';
import '../screens/drawer_menu_widget.dart';

class AccountPage extends StatelessWidget{
  final VoidCallback openDrawer;

  const AccountPage({
    Key? key,
    required this.openDrawer,
  }) :super(key: key);
  @override 
  Widget build(BuildContext context)=>Scaffold(
    backgroundColor: Colors.transparent,
    appBar: AppBar(
      backgroundColor: Colors.transparent,
      leading: DrawerMenuWidget( onClicked: openDrawer),
      title: Text('AccountPage'),
      
    ),
     body: const Center(
        child: Text(
          'Accounts Page',
          style: TextStyle(
          fontSize: 40,
        )
        ),

  ));
}