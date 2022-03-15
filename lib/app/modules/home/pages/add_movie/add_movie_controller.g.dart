// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_movie_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AddMovieController on _AddMovieControllerBase, Store {
  Computed<String>? _$validTitleComputed;

  @override
  String get validTitle =>
      (_$validTitleComputed ??= Computed<String>(() => super.validTitle,
              name: '_AddMovieControllerBase.validTitle'))
          .value;
  Computed<String>? _$validNoteComputed;

  @override
  String get validNote =>
      (_$validNoteComputed ??= Computed<String>(() => super.validNote,
              name: '_AddMovieControllerBase.validNote'))
          .value;
  Computed<String>? _$validTypeComputed;

  @override
  String get validType =>
      (_$validTypeComputed ??= Computed<String>(() => super.validType,
              name: '_AddMovieControllerBase.validType'))
          .value;
  Computed<String>? _$validDescriptionComputed;

  @override
  String get validDescription => (_$validDescriptionComputed ??=
          Computed<String>(() => super.validDescription,
              name: '_AddMovieControllerBase.validDescription'))
      .value;
  Computed<bool>? _$formIsValidComputed;

  @override
  bool get formIsValid =>
      (_$formIsValidComputed ??= Computed<bool>(() => super.formIsValid,
              name: '_AddMovieControllerBase.formIsValid'))
          .value;

  final _$titleAtom = Atom(name: '_AddMovieControllerBase.title');

  @override
  String get title {
    _$titleAtom.reportRead();
    return super.title;
  }

  @override
  set title(String value) {
    _$titleAtom.reportWrite(value, super.title, () {
      super.title = value;
    });
  }

  final _$noteAtom = Atom(name: '_AddMovieControllerBase.note');

  @override
  double get note {
    _$noteAtom.reportRead();
    return super.note;
  }

  @override
  set note(double value) {
    _$noteAtom.reportWrite(value, super.note, () {
      super.note = value;
    });
  }

  final _$selectedTypeAtom = Atom(name: '_AddMovieControllerBase.selectedType');

  @override
  String get selectedType {
    _$selectedTypeAtom.reportRead();
    return super.selectedType;
  }

  @override
  set selectedType(String value) {
    _$selectedTypeAtom.reportWrite(value, super.selectedType, () {
      super.selectedType = value;
    });
  }

  final _$descriptionAtom = Atom(name: '_AddMovieControllerBase.description');

  @override
  String get description {
    _$descriptionAtom.reportRead();
    return super.description;
  }

  @override
  set description(String value) {
    _$descriptionAtom.reportWrite(value, super.description, () {
      super.description = value;
    });
  }

  final _$dropDownTypeExpandedAtom =
      Atom(name: '_AddMovieControllerBase.dropDownTypeExpanded');

  @override
  bool get dropDownTypeExpanded {
    _$dropDownTypeExpandedAtom.reportRead();
    return super.dropDownTypeExpanded;
  }

  @override
  set dropDownTypeExpanded(bool value) {
    _$dropDownTypeExpandedAtom.reportWrite(value, super.dropDownTypeExpanded,
        () {
      super.dropDownTypeExpanded = value;
    });
  }

  final _$_AddMovieControllerBaseActionController =
      ActionController(name: '_AddMovieControllerBase');

  @override
  dynamic setTitle(String v) {
    final _$actionInfo = _$_AddMovieControllerBaseActionController.startAction(
        name: '_AddMovieControllerBase.setTitle');
    try {
      return super.setTitle(v);
    } finally {
      _$_AddMovieControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setNote(String v) {
    final _$actionInfo = _$_AddMovieControllerBaseActionController.startAction(
        name: '_AddMovieControllerBase.setNote');
    try {
      return super.setNote(v);
    } finally {
      _$_AddMovieControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setSelectedType(String type) {
    final _$actionInfo = _$_AddMovieControllerBaseActionController.startAction(
        name: '_AddMovieControllerBase.setSelectedType');
    try {
      return super.setSelectedType(type);
    } finally {
      _$_AddMovieControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setDescription(String v) {
    final _$actionInfo = _$_AddMovieControllerBaseActionController.startAction(
        name: '_AddMovieControllerBase.setDescription');
    try {
      return super.setDescription(v);
    } finally {
      _$_AddMovieControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic expandDropDownType() {
    final _$actionInfo = _$_AddMovieControllerBaseActionController.startAction(
        name: '_AddMovieControllerBase.expandDropDownType');
    try {
      return super.expandDropDownType();
    } finally {
      _$_AddMovieControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
title: ${title},
note: ${note},
selectedType: ${selectedType},
description: ${description},
dropDownTypeExpanded: ${dropDownTypeExpanded},
validTitle: ${validTitle},
validNote: ${validNote},
validType: ${validType},
validDescription: ${validDescription},
formIsValid: ${formIsValid}
    ''';
  }
}
