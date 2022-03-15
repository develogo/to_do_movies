import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

class DropdownMovieTypeWidget extends StatelessWidget {
  final String erroMessage;
  final Function(String? value) onChanged;

  const DropdownMovieTypeWidget({
    Key? key,
    required this.erroMessage,
    required this.onChanged,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Text(
            'Tipo',
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
            child: DropdownSearch<String?>(
              mode: Mode.BOTTOM_SHEET,
              items: ["Filme", "Série"],
              maxHeight: 130,
              onChanged: onChanged,
              hint: "Selecione o tipo",
              dropdownButtonBuilder: (context) => Padding(
                padding: const EdgeInsets.only(right: 15),
                child: Icon(
                  Icons.keyboard_arrow_down_sharp,
                  size: 32,
                ),
              ),
              dropdownSearchDecoration: InputDecoration(
                hintStyle: TextStyle(fontSize: 15, color: Colors.grey.shade500),
                contentPadding: EdgeInsets.only(left: 10),
                border: InputBorder.none,
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(5),
          child: AnimatedOpacity(
            duration: Duration(milliseconds: 250),
            opacity: 1,
            curve: Curves.easeInCubic,
            child: Text(
              erroMessage,
              style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
                fontSize: 13,
              ),
            ),
          ),
        )
      ],
    );
  }
}
