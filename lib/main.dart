import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tabtest/page1_1.dart';
import 'package:tabtest/page1_2.dart';
import 'package:tabtest/stacks.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  int currentIndex = 0;
  List<int> stackHistory = [];

  @override
  void initState() {
    super.initState();
    Stacks.init(2, this);
    Stacks.stacks[0].add(Page1_1(index: 0));
    Stacks.stacks[1].add(Page1_2(index: 1));
    stackHistory.add(0);
  }

  void _onItemTapped(int index) {
    setState(() {
      if (currentIndex == index) {
        Stacks.popToFirst(index);
      } else {
        currentIndex = index;
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
      currentIndex = stackHistory.last;
    });
  }

  Future<bool> _onWillPop() {
    if (!Stacks.pop(currentIndex)) {
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
        body: Stacks.stacks[currentIndex].last,
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
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
