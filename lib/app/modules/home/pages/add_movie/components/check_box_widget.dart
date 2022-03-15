import 'package:flutter/material.dart';

class CheckBoxWidget extends StatelessWidget {
  final String title;
  final bool valid;
  final bool value;
  final Function(bool? v) onChanged;

  const CheckBoxWidget({
    Key? key,
    required this.title,
    required this.value,
    required this.onChanged,
    required this.valid,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(title),
        Theme(
          data: ThemeData(
            unselectedWidgetColor: valid ? Colors.grey : Colors.red,
          ),
          child: Checkbox(
            tristate: false,
            value: value,
            onChanged: onChanged,
          ),
        ),
      ],
    );
  }
}
