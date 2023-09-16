class SizeHelper {
  SizeHelper._();

  static SizeHelper instance = SizeHelper._();

  late double _safeAreaTopPadding;
  late double _safeAreaBottomPadding;

  void initSafeAreaPadding(double top, double bottom) {
    _safeAreaTopPadding = top;
    _safeAreaBottomPadding = bottom;
  }

  double topPadding(double designTopPadding) {
    if (designTopPadding >= _safeAreaTopPadding) {
      return designTopPadding - _safeAreaTopPadding;
    } else {
      return designTopPadding;
    }
  }

  double bottomPadding(double designBottomPadding) {
    if (designBottomPadding >= _safeAreaBottomPadding) {
      return designBottomPadding - _safeAreaBottomPadding;
    } else {
      return designBottomPadding;
    }
  }
}

extension UIHelper on double {
  double get topPadding {
    return SizeHelper.instance.topPadding(this);
  }

  double get bottomPadding {
    return SizeHelper.instance.bottomPadding(this);
  }
}
