import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tab_bar/page2_1.dart';
import 'package:tab_bar/stacks.dart';

import 'nav_bar.dart';

class Page1_1 extends StatelessWidget {
  const Page1_1({Key key, this.index}) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    print("1_1 building");
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text("page 1 tab 1"),
      ),
      bottomNavigationBar: NavBar(index: index),
      body: GestureDetector(
          onTap: () {
            Stacks.stacks[index].add(Page2_1(index: index));
          },
          child: Center(child: Text("this is page 1 tab 1"))),
    );
  }
}
