import 'package:flutter/material.dart';
import '../Utility/constants.dart';

class GenderButton extends StatelessWidget {
  final String lable;
  final Color color;
  final IconData icon;
  final VoidCallback func;

  const GenderButton(
      {super.key,
      required this.lable,
      required this.icon,
      required this.func,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: func,
        child: Card(
          color: color,
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Icon(
                    icon,
                    color: Colors.white,
                    size: 60,
                  ),
                ),
                Text(
                  lable,
                  style: kLabelTextStyle,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
