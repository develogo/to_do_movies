// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on HomeControllerBase, Store {
  final _$moviesAtom = Atom(name: 'HomeControllerBase.movies');

  @override
  ObservableList<Movie> get movies {
    _$moviesAtom.reportRead();
    return super.movies;
  }

  @override
  set movies(ObservableList<Movie> value) {
    _$moviesAtom.reportWrite(value, super.movies, () {
      super.movies = value;
    });
  }

  final _$searchResultAtom = Atom(name: 'HomeControllerBase.searchResult');

  @override
  ObservableList<Movie> get searchResult {
    _$searchResultAtom.reportRead();
    return super.searchResult;
  }

  @override
  set searchResult(ObservableList<Movie> value) {
    _$searchResultAtom.reportWrite(value, super.searchResult, () {
      super.searchResult = value;
    });
  }

  final _$expandedSearchBarAtom =
      Atom(name: 'HomeControllerBase.expandedSearchBar');

  @override
  bool get expandedSearchBar {
    _$expandedSearchBarAtom.reportRead();
    return super.expandedSearchBar;
  }

  @override
  set expandedSearchBar(bool value) {
    _$expandedSearchBarAtom.reportWrite(value, super.expandedSearchBar, () {
      super.expandedSearchBar = value;
    });
  }

  final _$searchTermAtom = Atom(name: 'HomeControllerBase.searchTerm');

  @override
  String get searchTerm {
    _$searchTermAtom.reportRead();
    return super.searchTerm;
  }

  @override
  set searchTerm(String value) {
    _$searchTermAtom.reportWrite(value, super.searchTerm, () {
      super.searchTerm = value;
    });
  }

  final _$searchEditControllerAtom =
      Atom(name: 'HomeControllerBase.searchEditController');

  @override
  TextEditingController get searchEditController {
    _$searchEditControllerAtom.reportRead();
    return super.searchEditController;
  }

  @override
  set searchEditController(TextEditingController value) {
    _$searchEditControllerAtom.reportWrite(value, super.searchEditController,
        () {
      super.searchEditController = value;
    });
  }

  final _$expandedItemIndexAtom =
      Atom(name: 'HomeControllerBase.expandedItemIndex');

  @override
  int get expandedItemIndex {
    _$expandedItemIndexAtom.reportRead();
    return super.expandedItemIndex;
  }

  @override
  set expandedItemIndex(int value) {
    _$expandedItemIndexAtom.reportWrite(value, super.expandedItemIndex, () {
      super.expandedItemIndex = value;
    });
  }

  final _$HomeControllerBaseActionController =
      ActionController(name: 'HomeControllerBase');

  @override
  dynamic removeMovie(int index) {
    final _$actionInfo = _$HomeControllerBaseActionController.startAction(
        name: 'HomeControllerBase.removeMovie');
    try {
      return super.removeMovie(index);
    } finally {
      _$HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic loadMovies() {
    final _$actionInfo = _$HomeControllerBaseActionController.startAction(
        name: 'HomeControllerBase.loadMovies');
    try {
      return super.loadMovies();
    } finally {
      _$HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setExpandedSearchBar() {
    final _$actionInfo = _$HomeControllerBaseActionController.startAction(
        name: 'HomeControllerBase.setExpandedSearchBar');
    try {
      return super.setExpandedSearchBar();
    } finally {
      _$HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic onSearch(String search) {
    final _$actionInfo = _$HomeControllerBaseActionController.startAction(
        name: 'HomeControllerBase.onSearch');
    try {
      return super.onSearch(search);
    } finally {
      _$HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic clearSearch() {
    final _$actionInfo = _$HomeControllerBaseActionController.startAction(
        name: 'HomeControllerBase.clearSearch');
    try {
      return super.clearSearch();
    } finally {
      _$HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic expandItem(int index) {
    final _$actionInfo = _$HomeControllerBaseActionController.startAction(
        name: 'HomeControllerBase.expandItem');
    try {
      return super.expandItem(index);
    } finally {
      _$HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
movies: ${movies},
searchResult: ${searchResult},
expandedSearchBar: ${expandedSearchBar},
searchTerm: ${searchTerm},
searchEditController: ${searchEditController},
expandedItemIndex: ${expandedItemIndex}
    ''';
  }
}
