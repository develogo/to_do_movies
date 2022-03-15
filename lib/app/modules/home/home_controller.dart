import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import 'package:mobx/mobx.dart';
import 'package:to_do_list/app/adapters/movie.dart';
import 'package:to_do_list/app/interfaces/local_storage_service_interface.dart';

part 'home_controller.g.dart';

class HomeController = HomeControllerBase with _$HomeController;

abstract class HomeControllerBase with Store {
  final ILocalStorageService _storageService;

  HomeControllerBase(this._storageService);

  @observable
  ObservableList<Movie> movies = <Movie>[].asObservable();

  @observable
  ObservableList<Movie> searchResult = <Movie>[].asObservable();

  @action
  removeMovie(int index) {
    _storageService.delete(movies[index]);
    movies.removeAt(index);
  }

  @action
  loadMovies() {
    var moviesList = _storageService.getAll();
    movies = moviesList.asObservable();
  }

  @observable
  bool expandedSearchBar = false;
  @action
  setExpandedSearchBar() => expandedSearchBar = !expandedSearchBar;

  @observable
  String searchTerm = '';

  @action
  onSearch(String search) {
    searchTerm = search;
    List<Movie> tempList = [];
    movies.forEach((element) {
      if (element.title.toUpperCase().startsWith(search.toUpperCase())) {
        tempList.add(element);
      }
    });
    searchResult = tempList.asObservable();
  }

  @observable
  TextEditingController searchEditController = TextEditingController();
  @action
  clearSearch() {
    searchEditController.clear();
    searchTerm = '';
  }

  @observable
  int expandedItemIndex = -1;
  @action
  expandItem(int index) {
    if (expandedItemIndex == index) {
      return expandedItemIndex = -1;
    } else {
      return expandedItemIndex = index;
    }
  }
}
