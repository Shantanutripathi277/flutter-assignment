import 'package:flutter/material.dart';
import './drawer_item.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class DrawerItems{
  static const Home = DrawerItem(title:'Home',icon: FontAwesomeIcons.home);
  static const Revenue = DrawerItem(title:'Revenue',icon: FontAwesomeIcons.moneyCheck);
  static const Settings = DrawerItem(title:'Settings',icon: Icons.settings);
  static const Account = DrawerItem(title:'Account',icon: FontAwesomeIcons.userAlt);

  static final List<DrawerItem> all =[
    Home,
    Revenue,
    Settings,
    Account,
  ];
}