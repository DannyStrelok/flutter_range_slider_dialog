
## flutter_range_slider_dialog Plugin
![GitHub last commit](https://img.shields.io/github/last-commit/DannyStrelok/flutter_range_slider_dialog)
[![GitHub code size in bytes](https://img.shields.io/github/languages/code-size/DannyStrelok/flutter_range_slider_dialog)](https://github.com/DannyStrelok/flutter_range_slider_dialog)

Flutter Range Slider is a flutter package which shows a dialog with a RangeSlider within.

![Overview](https://raw.githubusercontent.com/DannyStrelok/flutter_range_slider_dialog/master/doc/images/flutter_range_slider_dialog_demo.gif)

## Data flow
* Invoke method `RangeSliderDialog.display()` to display RangeSlider dialog.
* Select the desired range.
* Click `Accept` button return the selected values and close the dialog.
* Click `Cancel` button to close the dialog and discard the changes.

## Getting Started
### 1. Add library to your pubspec.yaml



```yaml

dependencies:
  range_slider_dialog: ^0.0.1

```

### 2. Import library in dart file

```dart
import 'package:range_slider_dialog/range_slider_dialog.dart';
```


### 3. Example of use

```dart
await RangeSliderDialog.display<int>(context,
      minValue: minPeople ?? 1,
      maxValue: maxPeople ?? 40,
      acceptButtonText: 'ACEPTAR',
      cancelButtonText: 'CANCELAR',
      headerText: 'Gente en el plan',
      selectedRangeValues: defaultValue, onApplyButtonClick: (value) {
    print('SHOW PEOPLE DIALOG');
    print(value);
    callback(value);
    Navigator.pop(context);
  });
```

## Parameters

| Parameter | Type     | Description                |
| :-------- | :------- | :------------------------- |
| height | `double` | Set height of filter dialog.|
| width  | `double` | Set width of filter dialog.|
| hideheader|`bool`|Hide the header|
| minValue  | `int` | Start range value. Default to 0.|
| maxValue  | `int` | End range value. Default to 40.|
| headerText    | `String?` | Custom header text. Default 'Select a range'|
| cancelButtonText   | `String?` | The text of the cancel button. Default 'CANCEL'|
| acceptButtonText   | `String?` | The text of the accept button. Default 'ACCEPT'|
| onApplyButtonClick|`Function(RangeValues? selectedValues)`|Return the choosen RangeValues|


## Contributions

Feel free to contribute to this project.

If you find a bug or want a feature, but don't know how to fix/implement it, please fill an [issue](https://github.com/DannyStrelok/flutter_range_slider_dialog/issues).
If you fixed a bug or implemented a feature, please send a [pull request](https://github.com/DannyStrelok/flutter_range_slider_dialog/pulls).
