import 'package:flutter/material.dart';

class SubmitButton extends StatelessWidget {
  const SubmitButton({@required this.onPressed, this.label});

  final void Function() onPressed;
  final String label;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: 150,
      height: 50,
      shape: StadiumBorder(),
      color: Theme.of(context).primaryColor,
      textColor: Colors.white,
      onPressed: onPressed,
      child: Text(label),
    );
  }
}
