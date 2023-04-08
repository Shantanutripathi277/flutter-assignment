import 'package:flutter/material.dart';
import '../screens/drawer_menu_widget.dart';
import '../screens/homepage.dart';
import '../screens/account.dart';
import '../screens/drawer_wiget.dart';
import '../screens/revenue.dart';
import '../screens/settings.dart';
import '../screens/drawer_item.dart';
import '../screens/drawer_items.dart';
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const title = 'Assignment';

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: title,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.white,
        primaryColor: Color.fromRGBO(21, 30 , 61, 1),
      ),
      home: MyHomePage(),
    );
  }
}
class MyHomePage extends StatefulWidget{
  @override
  _MainPage createState() => _MainPage();
}
class _MainPage extends State<MyHomePage>{
  late double x;
  late double y;
  late double scalefactor;
  late bool isDrawerOpen;
  DrawerItem item=DrawerItems.Home;
  bool isDragging=false;
  @override
  void initState(){
    super.initState();
    openDrawer();
  }

  void closeDrawer() => setState((){
    x=0;
    y=0;
    scalefactor=1;
    isDrawerOpen=false;
  });

  void openDrawer() => setState((){
    x=200;
    y=150;
    scalefactor=0.6;
    isDrawerOpen=true;
  });
  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: Theme.of(context).primaryColor,
    body: Stack(
      children: [
        buildDrawer(),
        buildPage(),
      ],
    )
  );
  Widget buildDrawer()=> SafeArea(
    child:DrawerWidget(
      onSelectedItem: (item){
        setState(()=>{
          this.item=item 
        });
        closeDrawer();
      },
    ));
  Widget buildPage(){
 
  return WillPopScope(
    onWillPop: ()async{
      if(isDrawerOpen){
        closeDrawer();
        return false;
      }
      else{
        return true;
      }
    },
    child:GestureDetector(
    onTap: closeDrawer,
    onHorizontalDragStart: (details)=> isDragging=true,
    onHorizontalDragUpdate: (details){
      const delta=1;
      if(details.delta.dx > delta)
      {
        openDrawer();
      }else if(details.delta.dx <-delta)
      {
        closeDrawer();
      }
      isDragging=false;
    },
    child: AnimatedContainer(
    duration: const Duration(milliseconds: 250),
    transform: Matrix4.translationValues(x, y, 0)..scale(scalefactor),
  child: AbsorbPointer(
    absorbing: isDrawerOpen,
    child: ClipRRect( 
      borderRadius: BorderRadius.circular(isDrawerOpen ? 20:0),
      child:Container(
      color:
       isDrawerOpen? Color.fromARGB(255, 3, 23, 66): Theme.of(context).primaryColor,
      child:getDrawerPage(),
      ))
  )
  )
  )
  );
 }
 Widget getDrawerPage(){
  switch (item){
    case DrawerItems.Settings:
      return SettingsPage(openDrawer: openDrawer);
    case DrawerItems.Account:
      return AccountPage(openDrawer: openDrawer);
    case DrawerItems.Revenue:
      return RevenuePage(openDrawer: openDrawer);
    case DrawerItems.Home:
    default:
      return Homepage(openDrawer: openDrawer);
  }
 }

}

