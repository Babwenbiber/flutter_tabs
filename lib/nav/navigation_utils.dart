import 'package:tabtest/nav/nav_bar_index.dart';
import 'package:tabtest/nav/stacks.dart';
import 'package:tabtest/pages/page1_1.dart';
import 'package:tabtest/pages/page1_2.dart';
import 'package:tabtest/pages/page2_1.dart';
import 'package:tabtest/pages/page2_2.dart';

bool navigatePop() {
  return Stacks.pop(NavBarIndex.getIndex());
}

navigateToPage1_1() {
  Stacks.push(NavBarIndex.getIndex(), Page1_1());
}

navigateToPage1_2() {
  Stacks.push(NavBarIndex.getIndex(), Page1_2());
}

navigateToPage2_1() {
  Stacks.push(NavBarIndex.getIndex(), Page2_1());
}

navigateToPage2_2() {
  Stacks.push(NavBarIndex.getIndex(), Page2_2());
}
