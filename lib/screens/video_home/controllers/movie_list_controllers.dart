import 'package:flutter_baseline/helpers/enum_helper.dart';
import 'package:flutter_baseline/models/movies/movie_list_model.dart';
import 'package:get/get.dart';

import '../../../Repos/movie_list_repo.dart';
import '../../../helpers/date_time_helper.dart';

class MovieListController extends GetxController {
  var movieList = <MovieListModel>[].obs;

  Future getMovieList() async {
    List<MovieListModel> tempMovieList = [];
    tempMovieList = await MovieListRepo(repoType: RepoType.mockData).get();
    movieList.clear();
    for (var movie in tempMovieList) {
      movieList.add(movie);
    }
  }

  
  void sortByLatestReleaseDate() {
    movieList.sort(((a, b) {
      var dtA = DateTimeHelper.strToDateTime(
        dateTime: a.sReleaseDate,
        dateTimeType: DateTimeType.yMd,
        spacingPattern: '-',
      );
      var dtB = DateTimeHelper.strToDateTime(
        dateTime: b.sReleaseDate,
        dateTimeType: DateTimeType.yMd,
        spacingPattern: '-',
      );
      return dtB!.compareTo(dtA!);
    }));
  }

  @override
  void onInit() {
    getMovieList();
    super.onInit();
  }
}
