
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class Homeprovider extends ChangeNotifier
{
  double webProgresser = 0;
  InAppWebViewController? inAppWebViewController;

  void changeProgress(double pg)
  {
    webProgresser = pg;
    notifyListeners();
  }
}