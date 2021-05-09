import 'package:flutter/material.dart';
import 'package:range_slider_dialog/range_slider_dialog.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dialog Range Slider demo',
      home: HomeDemo(),
    );
  }

}

class HomeDemo extends StatefulWidget {

  @override
  _HomeDemoState createState() => _HomeDemoState();
}

class _HomeDemoState extends State<HomeDemo> {

  RangeValues? _rangeValues = RangeValues(10, 20);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dialog Range Slider demo'),
      ),
      body: Center(
        child: Container(
          child: TextButton(
            child: Text('Open dialog'),
            onPressed: () {
              showRangeSliderDialog(context, 1, 100, this._rangeValues, (e) {
                setState(() {
                  this._rangeValues = e;
                });
              });
            },
          ),
        ),
      ),
    );
  }
}

void showRangeSliderDialog(BuildContext context, int? minValue, int? maxValue,
    RangeValues? defaultValue, Function(RangeValues?) callback) async {
  await RangeSliderDialog.display(context,
      minValue: minValue ?? 1,
      maxValue: maxValue ?? 40,
      acceptButtonText: 'ACCEPT',
      cancelButtonText: 'CANCEL',
      headerText: 'My awesome title',
      selectedRangeValues: defaultValue, onApplyButtonClick: (value) {
        callback(value);
        Navigator.pop(context);
      });
}