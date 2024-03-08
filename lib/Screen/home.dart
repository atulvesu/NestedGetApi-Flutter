import 'package:flutter/material.dart';
import 'package:practice/Screen/typeFourScreen.dart';
import 'package:practice/Screen/typeOneScreen.dart';
import 'package:practice/Screen/typeThreeScreen.dart';
import 'package:practice/Screen/typeTwoScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            bottom: const TabBar(
              tabs: [
                Tab(
                  icon: Icon(Icons.home),
                ),
                Tab(
                  icon: Icon(Icons.settings),
                ),
                Tab(
                  icon: Icon(Icons.person),
                ),
                Tab(
                  icon: Icon(Icons.ac_unit),
                ),
              ],
            ),
            title: Text("Get Api"),
            centerTitle: true,
          ),
          body: TabBarView(
            children: [
              TypeOneScreen(),
              TypeTwoScreen(),
              TypeThreeScreen(),
              TypeFourScreen(),
            ],
          ),
        ));
  }
}
