import 'package:flutter/material.dart';

import '../../Users/UI/UserUI.dart';
import '../../post/UI/Post_Page.dart';

// ignore: must_be_immutable
class TabScreen extends StatelessWidget {
  //TabCubit tabCubit = TabCubit();

  const TabScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          centerTitle: true,
          leading: const Icon(Icons.menu, size: 20, color: Colors.white),
          title: const Text('MS Global Task 1',
           style: TextStyle(fontFamily: "BarlowBold", color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold),),
          actions: const [Icon(Icons.search, size: 20, color: Colors.white)],
            bottom: const TabBar(
              tabs: [
                Tab(
          child: Text(
            "All posts",
            style: TextStyle(fontFamily: "BarlowBold", color: Colors.white,fontSize: 20),
          ),),
                Tab(
          child: Text(
            "Profile",
            style: TextStyle(fontFamily: "BarlowBold", color: Colors.white,fontSize: 20),
          ),),
              ],
            ),
        ),
        body: const TabBarView(
          children: [
            Post_Page(),
            UserScreen(),
          ],)
      ),
    );
  }
}


