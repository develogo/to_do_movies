import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:to_do_list/app/adapters/movie.dart';
import 'package:to_do_list/app/interfaces/local_storage_service_interface.dart';
import 'package:to_do_list/app/modules/home/home_controller.dart';

part 'add_movie_controller.g.dart';

class AddMovieController = _AddMovieControllerBase with _$AddMovieController;

abstract class _AddMovieControllerBase with Store {
  final ILocalStorageService _storageService;

  _AddMovieControllerBase(this._storageService);

  final _homeController = Modular.get<HomeController>();

  @observable
  String title = '';
  @observable
  double note = -1;
  @observable
  String selectedType = '';
  @observable
  String description = '';

  @action
  setTitle(String v) => title = v;
  @action
  setNote(String v) => note = v.isNotEmpty ? double.parse(v) : -1;
  @action
  setSelectedType(String type) => selectedType = type;
  @action
  setDescription(String v) => description = v;

  @computed
  String get validTitle => title.isEmpty ? 'Campo Obrigatorio' : '';

  @computed
  String get validNote {
    if (note >= 0 && note <= 10) {
      return '';
    } else if (note > 10) {
      return 'Insira um valor de 0 à 10';
    } else {
      return 'Campo Obrigatorio';
    }
  }

  @computed
  String get validType => selectedType.isEmpty ? 'Selecione uma opção' : '';

  @computed
  String get validDescription => description.isEmpty ? 'Campo Obrigatorio' : '';

  @computed
  bool get formIsValid {
    if (validTitle.isEmpty &&
        validNote.isEmpty &&
        validType.isEmpty &&
        validDescription.isEmpty) {
      return true;
    } else {
      return false;
    }
  }

  addMovie() {
    var movie = Movie(
        title: title, type: selectedType, note: note, description: description);
    _storageService.insert(movie);
    _homeController.movies.add(movie);
    Modular.to.pop();
  }

  @observable
  bool dropDownTypeExpanded = false;
  @action
  expandDropDownType() => dropDownTypeExpanded = !dropDownTypeExpanded;
}
