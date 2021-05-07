import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tabtest/page2_2.dart';
import 'package:tabtest/stacks.dart';

class Page1_2 extends StatelessWidget {
  const Page1_2({
    Key key,
    this.index,
  }) : super(key: key);
  final index;

  @override
  Widget build(BuildContext context) {
    print("1_2 building");
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text("page 1 tab 2"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("this is page 1 tab 2"),
            SizedBox(height: 20,),
            FloatingActionButton.extended(
              label: Text('next page'),
              onPressed: () {
                Stacks.push(index, Page2_2(index: index));
              },
            )
          ],
        ),
      ),
    );
  }
}
