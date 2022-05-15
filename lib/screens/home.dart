import 'package:flutter/material.dart';
import 'package:isro_quiz/constants.dart';
import 'package:isro_quiz/screens/about_screen.dart';
import 'package:isro_quiz/screens/quiz_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  TabController? tabController;
  @override
  void initState() {
    super.initState();
    tabController = new TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: SafeArea(
            child: Container(
              color: kThemeColor,
              height: 50.0,
              child: TabBar(
                indicatorColor: Colors.lightBlueAccent,
                unselectedLabelColor: Colors.black,
                labelColor: Colors.white,
                tabs: [
                  Tab(
                    text: "About ISRO",
                    height: 24.0,
                  ),
                  Tab(
                    text: "Quiz",
                  ),
                ],
              ),
            ),
          ),
        ),
        body: TabBarView(
          children: [
            AboutScreen(),
            Quiz(),
          ],
        ),
      ),
    );
  }
}
