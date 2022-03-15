import 'package:animate_icons/animate_icons.dart';
import 'package:flash/flash.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:to_do_list/app/modules/home/pages/add_movie/add_movie_controller.dart';
import 'package:to_do_list/app/modules/home/pages/add_movie/components/add_button_widget.dart';
import 'package:to_do_list/app/modules/home/pages/add_movie/components/add_text_field_widget.dart';
import 'package:to_do_list/app/shared/styles/colors.dart';

import 'components/dropdown_movie_type_widget.dart';

class AddMoviePage extends StatefulWidget {
  final String title;
  const AddMoviePage({Key? key, this.title = "Adicionar Filme ou Serie"}) : super(key: key);
  @override
  AddMoviePageState createState() => AddMoviePageState();
}

class AddMoviePageState extends ModularState<AddMoviePage, AddMovieController> {
  String dropdownValue = '0';

  AnimateIconController iconController = AnimateIconController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xFFEAEDF0),
      body: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (notification) {
          notification.disallowGlow();
          return true;
        },
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 10),
              Align(
                alignment: Alignment.topLeft,
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () => Navigator.of(context).pop(),
                      child: Icon(
                        Icons.arrow_back,
                        size: 32,
                        color: kMainColor,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 10),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Qual filme ou série gostaria de avaliar?',
                    style: TextStyle(
                      color: Colors.black.withOpacity(.5),
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 3, left: 10),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Conta pra nós 🎥',
                    style: TextStyle(
                      color: kMainColor.withOpacity(.9),
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  height: 3,
                  width: double.maxFinite,
                  color: kMainColor.withOpacity(.3),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10),
                    Observer(
                      builder: (_) => AddTextFieldWidget(
                        titleField: "Titulo",
                        hintText: "Nome do Filme ou Série",
                        errorMessage: controller.validTitle,
                        onChanged: (value) => controller.setTitle(value),
                        errorTextOpacity: controller.validTitle.isEmpty ? 0 : 1,
                      ),
                    ),
                    SizedBox(height: 15),
                    Observer(
                      builder: (_) => AddTextFieldWidget(
                        titleField: "Nota",
                        hintText: "Nota",
                        errorMessage: controller.validNote,
                        onChanged: (value) => controller.setNote(value),
                        errorTextOpacity: controller.validNote.isEmpty ? 0 : 1,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                            RegExp(r"[0-9.]"),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 15),
                    Observer(
                      builder: (context) => DropdownMovieTypeWidget(
                        erroMessage: controller.validType,
                        onChanged: (value) => controller.setSelectedType(value ?? ''),
                      ),
                    ),
                    // Column(
                    //   crossAxisAlignment: CrossAxisAlignment.start,
                    //   children: [
                    //     Padding(
                    //       padding: const EdgeInsets.only(bottom: 8),
                    //       child: Text(
                    //         'Tipo',
                    //         style: TextStyle(
                    //             fontWeight: FontWeight.bold, fontSize: 14),
                    //       ),
                    //     ),
                    //     Observer(
                    //       builder: (context) => AnimatedContainer(
                    //         duration: Duration(milliseconds: 200),
                    //         height: controller.dropDownTypeExpanded ? 170 : 50,
                    //         width: double.maxFinite,
                    //         decoration: BoxDecoration(
                    //           color: Colors.white,
                    //           borderRadius: BorderRadius.circular(10),
                    //           boxShadow: [
                    //             BoxShadow(
                    //               color: Colors.black.withOpacity(.1),
                    //               offset: Offset(0, 5),
                    //               blurRadius: 10,
                    //               spreadRadius: 2,
                    //             )
                    //           ],
                    //         ),
                    //         child: SingleChildScrollView(
                    //           physics: NeverScrollableScrollPhysics(),
                    //           child: Column(
                    //             children: [
                    //               Container(
                    //                 height: 50,
                    //                 width: double.maxFinite,
                    //                 decoration: BoxDecoration(
                    //                   borderRadius: BorderRadius.circular(10),
                    //                 ),
                    //                 child: Stack(
                    //                   alignment: Alignment.center,
                    //                   children: [
                    //                     Positioned(
                    //                       left: 10,
                    //                       child: Observer(
                    //                         builder: (_) => Text(
                    //                           controller.selectedType.isEmpty
                    //                               ? 'Selecione uma opção'
                    //                               : controller.selectedType,
                    //                           style: TextStyle(
                    //                             fontSize: 15,
                    //                             color: controller
                    //                                     .selectedType.isEmpty
                    //                                 ? Colors.grey.shade500
                    //                                 : Colors.black,
                    //                           ),
                    //                         ),
                    //                       ),
                    //                     ),
                    //                     Positioned(
                    //                       right: 10,
                    //                       child: AnimateIcons(
                    //                         startIcon: Icons.expand_more,
                    //                         endIcon: Icons.expand_less,
                    //                         size: 30,
                    //                         controller: iconController,
                    //                         onStartIconPress: () {
                    //                           FocusScope.of(context)
                    //                               .requestFocus(FocusNode());

                    //                           controller.expandDropDownType();
                    //                           return true;
                    //                         },
                    //                         onEndIconPress: () {
                    //                           FocusScope.of(context)
                    //                               .requestFocus(FocusNode());

                    //                           controller.expandDropDownType();

                    //                           return true;
                    //                         },
                    //                         duration: Duration(milliseconds: 300),
                    //                         startIconColor: Colors.grey,
                    //                         endIconColor: Colors.grey,
                    //                         clockwise: true,
                    //                       ),
                    //                     ),
                    //                   ],
                    //                 ),
                    //               ),
                    //               Material(
                    //                 child: ListTile(
                    //                   onTap: () {
                    //                     iconController.animateToStart();
                    //                     controller.setSelectedType(
                    //                         'filme'.toUpperCase());
                    //                     return controller.expandDropDownType();
                    //                   },
                    //                   title: Text(
                    //                     'Filme',
                    //                   ),
                    //                 ),
                    //               ),
                    //               Material(
                    //                 child: ListTile(
                    //                   onTap: () {
                    //                     iconController.animateToStart();
                    //                     controller.setSelectedType(
                    //                         'serie'.toUpperCase());
                    //                     return controller.expandDropDownType();
                    //                   },
                    //                   hoverColor: Colors.black,
                    //                   title: Text(
                    //                     'Serie',
                    //                   ),
                    //                 ),
                    //               ),
                    //             ],
                    //           ),
                    //         ),
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    SizedBox(height: 15),
                    Observer(
                      builder: (_) => AddTextFieldWidget(
                        titleField: "Descrição",
                        hintText: "Escreva um resumo",
                        errorMessage: controller.validDescription,
                        onChanged: (value) => controller.setDescription(value),
                        errorTextOpacity: controller.validDescription.isEmpty ? 0 : 1,
                        countDigit: controller.description.length,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(200),
                        ],
                      ),
                    ),
                    SizedBox(height: 15),
                  ],
                ),
              ),
              AddButtonWidget(
                onPressed: () {
                  controller.formIsValid ? controller.addMovie() : _showTopFlash();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showTopFlash() {
    showFlash(
      context: context,
      duration: const Duration(seconds: 2),
      builder: (_, controller) {
        return Flash(
          controller: controller,
          backgroundColor: Colors.white,
          brightness: Brightness.light,
          borderRadius: BorderRadius.circular(20),
          margin: EdgeInsets.all(5),
          boxShadows: [BoxShadow(blurRadius: 4)],
          barrierBlur: 3.0,
          barrierColor: Colors.black38,
          barrierDismissible: true,
          position: FlashPosition.top,
          child: Container(
            height: 80,
            color: Colors.red,
            child: Center(
              child: FlashBar(
                title: Text(
                  'Preencha todos os campos',
                  style: TextStyle(color: Colors.white),
                ),
                content: Text(
                  'Falta preencher algo',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
