import 'package:flutter/material.dart';
import '../Utility/constants.dart';

class HeightCard extends StatefulWidget {
  const HeightCard(
      {super.key, required this.height, required this.onHeightChanged});

  final int height;
  final ValueChanged<int> onHeightChanged;

  @override
  State<HeightCard> createState() => _HeightCardState();
}

class _HeightCardState extends State<HeightCard> {
  double _currentSliderValue = 180;
  void initState() {
    super.initState();
    _currentSliderValue = widget.height.toDouble();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: kInactiveCardColour,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Height", style: kLabelTextStyle),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(widget.height.toString(), style: kNumberTextStyle),
              Baseline(
                baseline: 40,
                baselineType: TextBaseline.alphabetic,
                child: Text(
                  "CM",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
          Slider(
            value: _currentSliderValue,
            max: 240,
            min: 140,
            label: _currentSliderValue.round().toString(),
            onChanged: (double value) {
              setState(() {
                _currentSliderValue = value;
              });
              widget.onHeightChanged(value.round());
            },
          )
        ],
      ),
    );
  }
}
