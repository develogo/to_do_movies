import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:to_do_list/app/modules/home/home_controller.dart';

class InputMovieDialog extends StatefulWidget {
  final Function() onTapCancel;
  final Function() onTapConfirm;

  const InputMovieDialog({
    Key? key,
    required this.onTapCancel,
    required this.onTapConfirm,
  }) : super(key: key);

  @override
  _InputMovieDialogState createState() => _InputMovieDialogState();
}

class _InputMovieDialogState extends State<InputMovieDialog> {
  HomeController controller = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      elevation: 0,
      backgroundColor: Colors.white,
      child: contentBox(context),
    );
  }

  contentBox(context) {
    return Container(
      width: 250,
      //height: 160,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Titulo',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey.shade700),
                  ),
                  Container(
                    height: 45,
                    child: TextField(
                      onChanged: (value) {},
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 10),
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  Text(
                    'Nota',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey.shade700),
                  ),
                  Container(
                    height: 45,
                    child: TextField(
                      onChanged: (value) {},
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 10),
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  Text(
                    'Tipo',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey.shade700,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        children: [
                          Text('Filme'),
                          // Observer(
                          //   builder: (_) => Checkbox(
                          //     value:
                          //         controller.selectedType == 'f' ? true : false,
                          //     onChanged: (value) =>
                          //         controller.setSelectedType('f'),
                          //   ),
                          // ),
                        ],
                      ),
                      Row(
                        children: [
                          Text('Serie'),
                          // Observer(
                          //   builder: (_) => Checkbox(
                          //     value:
                          //         controller.selectedType == 's' ? true : false,
                          //     onChanged: (value) =>
                          //         controller.setSelectedType('s'),
                          //   ),
                          // ),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
            Container(
              height: 1,
              color: Colors.grey.shade300,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                    height: 45,
                    child: TextButton(
                      onPressed: widget.onTapCancel,
                      child: Text("Não"),
                    ),
                  ),
                ),
                Container(
                  height: 48,
                  width: 1,
                  color: Colors.grey.shade300,
                ),
                Expanded(
                  child: Container(
                    height: 45,
                    child: TextButton(
                      onPressed: widget.onTapConfirm,
                      child: Text("Sim"),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
