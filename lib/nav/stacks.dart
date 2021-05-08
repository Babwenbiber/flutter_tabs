import 'dart:collection';

import 'package:flutter/material.dart';

import 'home.dart';

class Stacks {
  static List<Queue> stacks = <Queue>[];
  static MyHomePageState homeState;
  static init(length, home) {
    homeState = home;
    if (stacks.length == 0)
      for (int i = 0; i < length; i++) {
        stacks.add(Queue<Widget>());
      }
  }

  static bool pop(stackNumber) {
    print(
        "popping stacknum $stackNumber with len ${stacks[stackNumber].length}");
    if (stacks[stackNumber].length <= 1) {
      return false;
    }
    stacks[stackNumber].removeLast();
    homeState.refresh();
    return true;
  }

  static popToFirst(stackNumber) {
    for (int i = 0; i < stacks[stackNumber].length - 1; i++) {
      stacks[stackNumber].removeLast();
    }
  }

  static push(stackNumber, route) {
    print('adding to ' + stackNumber.toString());
    stacks[stackNumber].addLast(route);
    homeState.refresh();
  }
}
