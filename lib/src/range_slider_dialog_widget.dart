library range_slider_dialog;

import 'package:flutter/material.dart';

part 'range_slider_picker_widget.dart';

class RangeSliderDialog {
  static Future display<T>(
    context, {
    required OnApplyButtonClick<T> onApplyButtonClick,
    double? height,
    double? width,
    double borderRadius = 20,
    bool barrierDismissible = true,
    bool useSafeArea = true,
    bool useRootNavigator = true,
    RouteSettings? routeSettings,
    RangeValues? selectedRangeValues,
    int minValue = 0,
    int maxValue = 40,
    int divisions = 1,
  }) async {
    if (height == null) {
      height = MediaQuery.of(context).size.height * .8;
    }
    if (width == null) {
      width = MediaQuery.of(context).size.width;
    }
    await showDialog(
        context: context,
        barrierDismissible: barrierDismissible,
        routeSettings: routeSettings,
        useRootNavigator: useRootNavigator,
        useSafeArea: useSafeArea,
        builder: (BuildContext context) {
          return Dialog(
            elevation: 0,
            backgroundColor: Colors.transparent,
            child: Container(
              height: height,
              width: width,
              color: Colors.transparent,
              child: RangeSliderPicker(
                onApplyButtonClick: onApplyButtonClick,
                divisions: divisions,
                maxValue: maxValue,
                minValue: minValue,
                selectedRangeValues: selectedRangeValues,
              ),
            ),
          );
        });
  }
}
