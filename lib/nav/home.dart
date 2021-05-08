import 'package:flutter/material.dart';
import 'package:tabtest/nav/nav_bar_index.dart';
import 'package:tabtest/nav/navigation_utils.dart';
import 'package:tabtest/nav/stacks.dart';
import 'package:tabtest/pages/page1_1.dart';
import 'package:tabtest/pages/page1_2.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  List<int> stackHistory = [];

  @override
  void initState() {
    super.initState();
    Stacks.init(2, this);
    Stacks.stacks[0].add(Page1_1());
    Stacks.stacks[1].add(Page1_2());
    stackHistory.add(0);
  }

  void _onItemTapped(int index) {
    setState(() {
      if (NavBarIndex.getIndex() == index) {
        Stacks.popToFirst(index);
      } else {
        NavBarIndex.setIndex(index);
      }
    });
    //add current index as last item in to stack history
    stackHistory.remove(index);
    stackHistory.add(index);
  }

  popStackHistory() {
    print("popping Stack history $stackHistory");
    if (stackHistory.length >= 1) {
      stackHistory.removeLast();
    }
    setState(() {
      NavBarIndex.setIndex(stackHistory.last);
    });
  }

  Future<bool> _onWillPop() {
    if (!navigatePop()) {
      popStackHistory();
    }
  }

  refresh() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        body: Stacks.stacks[NavBarIndex.getIndex()].last,
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: NavBarIndex.getIndex(),
          onTap: _onItemTapped,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.add), title: Text("tab1")),
            BottomNavigationBarItem(icon: Icon(Icons.deck), title: Text("tab2"))
          ],
        ),
      ),
    );
  }
}
