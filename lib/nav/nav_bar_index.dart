class NavBarIndex {
  static final NavBarIndex _instance = NavBarIndex._internal();

  int index = 0;

  static void setIndex(int index) {
    _instance.index = index;
  }

  static int getIndex() {
    return _instance.index;
  }

  factory NavBarIndex() {
    return _instance;
  }

  NavBarIndex._internal();
}
