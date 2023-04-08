import 'package:flutter/material.dart';
import './drawer_menu_widget.dart';
import './barchartwidget.dart';


class RevenuePage extends StatelessWidget{
  final VoidCallback openDrawer;

  const RevenuePage({
    Key? key,
    required this.openDrawer,
  }) :super(key: key);
  @override 
  Widget build(BuildContext context)=>Card(
    elevation: 4,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
    color: const Color(0xff020227),
    child: Padding(padding: 
    const EdgeInsets.only(top: 16),
    child:BarChartWidget(),
    ),  
  );
}