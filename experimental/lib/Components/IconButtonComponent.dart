import 'package:flutter/material.dart';

class IconButtonComponent extends StatefulWidget {
  const IconButtonComponent(
      {super.key, required this.func, required this.icon});

  final IconData icon;
  final VoidCallback func;

  @override
  State<IconButtonComponent> createState() => _IconButtonComponentState();
}

class _IconButtonComponentState extends State<IconButtonComponent> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      style: IconButton.styleFrom(backgroundColor: Colors.white),
      onPressed: widget.func,
      icon: Icon(widget.icon),
    );
  }
}
