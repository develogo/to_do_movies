import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class AddTextFieldWidget extends StatelessWidget {
  final Function(String value) onChanged;
  final String hintText;
  final double errorTextOpacity;
  final TextInputType keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final String errorMessage;
  final String? titleField;
  final int? countDigit;

  const AddTextFieldWidget({
    Key? key,
    required this.onChanged,
    required this.errorTextOpacity,
    this.hintText = '',
    this.keyboardType = TextInputType.text,
    this.inputFormatters,
    required this.errorMessage,
    this.titleField,
    this.countDigit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Text(
            titleField ?? '',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(.1),
                offset: Offset(0, 5),
                blurRadius: 10,
                spreadRadius: 2,
              )
            ],
          ),
          child: ConstrainedBox(
            constraints: BoxConstraints(maxHeight: 300.0, minHeight: 50),
            child: TextField(
              onChanged: onChanged,
              keyboardType: keyboardType,
              inputFormatters: inputFormatters,
              maxLines: null,
              decoration: InputDecoration(
                hintStyle: TextStyle(fontSize: 15, color: Colors.grey.shade500),
                hintText: hintText,
                contentPadding:
                    EdgeInsets.only(left: 10, right: 10, bottom: 8, top: 8),
                border: InputBorder.none,
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AnimatedOpacity(
                duration: Duration(milliseconds: 250),
                opacity: errorTextOpacity,
                curve: Curves.easeInCubic,
                child: Text(
                  errorMessage,
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                  ),
                ),
              ),
              countDigit == null
                  ? Container()
                  : Text('${countDigit?.toString() ?? ''}/200')
            ],
          ),
        )
      ],
    );
  }
}
