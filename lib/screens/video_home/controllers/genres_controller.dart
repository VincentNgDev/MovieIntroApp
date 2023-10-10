import 'package:flutter_baseline/helpers/enum_helper.dart';
import 'package:get/get.dart';

import '../../../Repos/genres_repo.dart';
import '../../../models/movies/genres_model.dart';

class GenresController extends GetxController {
  var genresList = <GenresModelDTO>[].obs;

  Future getGenres() async {
    var tempGenres = await GenresRepo(repoType: RepoType.mockData).get();
    genresList.clear();
    for (var genresDto in tempGenres) {
      genresList.add(genresDto);
    }
  }

  @override
  void onInit() {
    super.onInit();
    getGenres();
  }
}
