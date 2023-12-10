import 'package:flutter/material.dart';
import '../widget_component/bottomNav/bottom_nav_value1.dart';
import '../widget_component/bottomNav/bottom_nav_value2.dart';
import '../widget_component/bottomNav/bottom_nav_value3.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

List<Widget> widgets = [
  BottomPage1(),
  BottomPage2(),
  BottomPage3(),
];

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Container(
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("For Vikas", style: TextStyle(color: Colors.white),),
              Icon(Icons.search, color: Colors.white,)
            ],
          ),
        )
      ),
      body: SafeArea(child: widgets[currentIndex]),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(40)),
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black.withOpacity(.1),
            )
          ],
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.black,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white.withOpacity(.60),
          selectedFontSize: 14,
          unselectedFontSize: 14,
          onTap: (value) {
            setState(() {
              currentIndex = value;
            });
          },
          items: [
            BottomNavigationBarItem(
              label: 'Home',
              icon: Icon(Icons.home_outlined),
            ),
            BottomNavigationBarItem(
              label: 'New & Hot',
              icon: Icon(Icons.photo_library_sharp),
            ),
            BottomNavigationBarItem(
              label: 'My Netflix',
              icon: Icon(Icons.account_box_outlined),
            ),
          ],
        ),
      ),
    );
  }
}
