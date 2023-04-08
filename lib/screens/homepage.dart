import 'package:flutter/material.dart';
import './drawer_menu_widget.dart';

class Homepage extends StatelessWidget {
  final VoidCallback openDrawer;

  const Homepage({
    Key? key,
    required this.openDrawer,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) => Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: DrawerMenuWidget(onClicked: openDrawer),
        title: Text('HomePage'),
      ),
      body: const Center(
        child: Text(
          'HomePage',
          style: TextStyle(
          fontSize: 40,
        )
        ),
      ));
}
