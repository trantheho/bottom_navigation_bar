import 'package:bottomnavigationbar/history.dart';
import 'package:bottomnavigationbar/home.dart';
import 'package:bottomnavigationbar/map.dart';
import 'package:bottomnavigationbar/profile.dart';
import 'package:flutter/material.dart';

import 'bottom_navigation_bar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  List<Widget> _children;
  int childrenIndex;

  @override
  void initState() {
    super.initState();
    initChildren();
    childrenIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        margin: EdgeInsets.only(bottom: 12),
        height: 50,
        width: 50,
        child: FloatingActionButton(
          backgroundColor: Color.fromRGBO(0, 153, 153, 1),
          onPressed: () { },
          tooltip: 'Increment',
          child: Icon(Icons.add, color: Colors.white,),
          elevation: 2.0,
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        index: 2,
        height: 50.0,
        items: <BottomBarItem>[
          BottomBarItem(icon: Icons.home, title: 'Trang chủ'),
          BottomBarItem(icon: Icons.search, title: 'Tìm kiếm'),
          BottomBarItem(icon: null, title: null),
          BottomBarItem(icon: Icons.history, title: 'Lịch sử'),
          BottomBarItem(icon: Icons.perm_identity, title: 'Cá nhân'),
        ],
        color: Color.fromRGBO(254, 254, 254, 1),
        selectedColor: Color.fromRGBO(0, 153, 153, 1),
        defaultColor: Colors.black45,
        backgroundColor: Colors.transparent.withOpacity(0),
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 300),
        onTap: (index) {
          setState(() {
            if(index == 2)
              childrenIndex = childrenIndex;
            if(index == 3)
              childrenIndex = 2;
            if(index == 4)
              childrenIndex = 3;
            if(index < 2)
              childrenIndex = index;
          });
        },
      ),
      body: _children[childrenIndex]
    );
  }

  initChildren(){
    return _children = [
      HomeScreen(),
      MapScreen(),
      HistoryScreen(),
      ProfileScreen()
    ];
  }
}
