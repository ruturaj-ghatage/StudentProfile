import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  ButtonWidget({
    required this.colour_name,
    required this.text,
    required this.onpressed,
  });

  final Color colour_name;
  final Text text;
  final VoidCallback onpressed;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5.0,
      color: colour_name,
      borderRadius: BorderRadius.all(Radius.circular(15.0)),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width * 0.5,
        onPressed: onpressed,
        child: text,
      ),
    );
  }
}
