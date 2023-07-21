import 'package:flutter/material.dart';

class UIController extends ChangeNotifier {
  Map? _widgetData;
  Map? get widgetData => _widgetData;
  setwidgetData(Map? value) {
    _widgetData = value;
    print("Widget Data Updated: $_widgetData");
    notifyListeners();
  }

  void generateWidgetData() {
    // Add 10s delay
    Future.delayed(const Duration(seconds: 3), () {
      setwidgetData(tempJsonData);
    });

    notifyListeners();
  }
}

var tempJsonData = {
  "type": "scaffold",
  "args": {
    "appBar": {
      "type": "app_bar",
      "args": {
        "title": {
          "type": "text",
          "args": {"text": "Dynamic Widgets"}
        }
      }
    },
    "body": {
      "type": "center",
      "child": {
        "type": "text",
        "args": {"text": "Hello World"}
      }
    }
  }
};
