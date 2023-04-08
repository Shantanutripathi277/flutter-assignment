import 'package:flutter/material.dart';
import './drawer_items.dart';
import './drawer_item.dart';

class DrawerWidget extends StatelessWidget {
  final ValueChanged<DrawerItem> onSelectedItem;

  const DrawerWidget({
    Key? key,
    required this.onSelectedItem,
  }): super(key: key);

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
          child: Column(
        children: [
          buildDrawerItems(context),
        ],
      ));
  Widget buildDrawerItems(BuildContext context) =>
      Column(children: DrawerItems.all.map((item) => ListTile(
        contentPadding: 
        EdgeInsets.only(left:20,top:8),
        leading: Icon(item.icon,color: Colors.white),
        title: Text(
          item.title,
          style: TextStyle(color: Colors.white,fontSize: 20)
        ),
        onTap: ()=> onSelectedItem(item),
      )).toList());
}
