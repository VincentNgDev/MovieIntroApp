import 'package:flutter_baseline/helpers/enum_helper.dart';
import 'package:get/get.dart';

import '../../../Repos/movie_details_repo.dart';
import '../../../models/movies/movie_details_model.dart';

class MovieDetailsController extends GetxController {
  var movieDetail = Rxn<MovieDetailsModel>();

  Future getMovieDetails(int iMovieId) async {
    print('Controller ${iMovieId}');
    movieDetail.value = await MovieDetailsRepo(repoType: RepoType.mockData).get(
      iMovieId: iMovieId,
    );
  }
}
