part of 'range_slider_dialog_widget.dart';

typedef OnApplyButtonClick<T> = Function(RangeValues? selectedValues);

class RangeSliderPicker extends StatefulWidget {
  final OnApplyButtonClick? onApplyButtonClick;
  final RangeValues? selectedRangeValues;
  final int minValue;
  final int maxValue;
  final int divisions;
  final bool? hideHeader;
  final String? headerText;
  final String? cancelButtonText;
  final String? acceptButtonText;

  const RangeSliderPicker(
      {Key? key,
      this.selectedRangeValues,
      this.onApplyButtonClick,
      this.divisions = 1,
      this.maxValue = 40,
      this.minValue = 0,
      this.hideHeader = false,
      this.headerText = 'Select a range',
      this.cancelButtonText = 'CANCEL',
      this.acceptButtonText = 'ACCEPT',})
      : super(key: key);

  @override
  _RangeSliderPickerState createState() => _RangeSliderPickerState();
}

class _RangeSliderPickerState extends State<RangeSliderPicker> {
  late RangeValues _selectedRangeValues;
  late RangeValues _originalSelectedRangeValues;

  @override
  void initState() {
    super.initState();
    _selectedRangeValues = widget.selectedRangeValues ??
        RangeValues(widget.minValue.toDouble(), widget.maxValue.toDouble());
    _originalSelectedRangeValues = _selectedRangeValues;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        child: Container(
          child: _body(),
        ),
      ),
    );
  }

  Widget _body() {
    return Container(
      color: Colors.white,
      child: Stack(
        children: [
          Column(
            children: [
              _header(),
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 0, horizontal: 5),
                  child: RangeSlider(
                    min: widget.minValue.toDouble(),
                    max: widget.maxValue.toDouble(),
                    values: this._selectedRangeValues,
                    divisions: widget.maxValue,
                    labels: RangeLabels(
                      this._selectedRangeValues.start.round().toString(),
                      this._selectedRangeValues.end.round().toString(),
                    ),
                    onChanged: (RangeValues values) {
                      setState(() {
                        this._selectedRangeValues = values;
                      });
                    },
                  ),
                ),
              )
            ],
          ),
          _dialogActions()
        ],
      ),
    );
  }

  Widget _header() {
    if( widget.hideHeader != null && widget.hideHeader == true) {
      return Container();
    }
    return Container(
      decoration: BoxDecoration(color: Colors.white, boxShadow: <BoxShadow>[
        BoxShadow(offset: Offset(0, 5), blurRadius: 15, color: Colors.black26)
      ]),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 1,
              child: Container(),
            ),
            Expanded(
              flex: 6,
              child: Center(
                child: Text(
                  widget.headerText != null ? widget.headerText! : '',
                  style: Theme.of(context).textTheme.headline4!.copyWith(
                        fontSize: 18,
                      ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: InkWell(
                borderRadius: BorderRadius.all(Radius.circular(30)),
                onTap: () => Navigator.pop(context, null),
                child: Container(
                  width: 25,
                  height: 25,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black54),
                      shape: BoxShape.circle),
                  child: Icon(
                    Icons.close,
                    color: Colors.black54,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _dialogActions() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 45,
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        alignment: Alignment.center,
        child: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              _actionButton(
                  label: widget.cancelButtonText != null ? widget.cancelButtonText! : '',
                  onPressed: () {
                    Navigator.pop(context, this._originalSelectedRangeValues);
                  }),
              _actionButton(
                  label: widget.acceptButtonText != null ? widget.acceptButtonText! : '',
                  onPressed: () {
                    if (widget.onApplyButtonClick != null) {
                      widget.onApplyButtonClick!(this._selectedRangeValues);
                    } else {
                      Navigator.pop(context, this._selectedRangeValues);
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }

  Widget _actionButton(
      {required String label,
      VoidCallback? onPressed,
      Color bgColor = Colors.transparent,
      double elevation = 0,
      TextStyle? textStyle}) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        label,
        style: textStyle,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
