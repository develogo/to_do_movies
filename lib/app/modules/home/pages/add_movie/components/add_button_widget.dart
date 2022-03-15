import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:to_do_list/app/shared/styles/colors.dart';

class AddButtonWidget extends StatelessWidget {
  final Function() onPressed;

  const AddButtonWidget({Key? key, required this.onPressed}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width * .8,
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: kMainColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          "Adicionar",
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
