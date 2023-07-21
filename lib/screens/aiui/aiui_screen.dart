import 'package:aiui/controllers/ui_controller.dart';
import 'package:flutter/material.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:provider/provider.dart';

class AIUIScreen extends StatefulWidget {
  const AIUIScreen({super.key});

  @override
  State<AIUIScreen> createState() => _AIUIScreenState();
}

class _AIUIScreenState extends State<AIUIScreen> {
  Map widgetsData = {
    "type": "scaffold",
    "args": {
      "appBar": {
        "type": "app_bar",
        "args": {
          "title": {
            "type": "text",
            "args": {"text": "Generating UI..."}
          }
        }
      },
      "body": {
        "type": "center",
        "child": {"type": "circular_progress_indicator"}
      }
    }
  };

  var registry = JsonWidgetRegistry.instance;

  @override
  void initState() {
    UIController uiController =
        Provider.of<UIController>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      uiController.generateWidgetData();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<UIController>(builder: (context, uiController, child) {
      if (uiController.widgetData != null) {
        widgetsData = uiController.widgetData!;
      }
      print("Widget Data: $widgetsData");
      var widget = JsonWidgetData.fromDynamic(widgetsData, registry: registry);
      return WillPopScope(
          onWillPop: () {
            uiController.setwidgetData(null);
            Navigator.pop(context);
            return Future.value(true);
          },
          child: widget!.build(context: context));
    });
  }
}
