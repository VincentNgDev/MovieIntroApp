import '../helpers/enum_helper.dart';
import '../models/movies/movie_details_model.dart';

abstract class MovieDetailsRepo {
  factory MovieDetailsRepo({RepoType repoType = RepoType.mockData}) {
    switch (repoType) {
      case RepoType.apiData:
        return MovieDetailsApi();
      case RepoType.mockData:
        return MovieDetailsMock();
    }
  }

  Future<MovieDetailsModel?> get({required int iMovieId});
}

class MovieDetailsApi implements MovieDetailsRepo {
  @override
  Future<MovieDetailsModel?> get({required int iMovieId}) async {
    return null;
  }
}

class MovieDetailsMock implements MovieDetailsRepo {
  @override
  Future<MovieDetailsModel?> get({required int iMovieId}) async {
    return await Future.delayed(
      const Duration(seconds: 2),
      () {
        if (iMovieId == 123) {
          return MovieDetailsModel(
            sMovieName: 'Spider Man',
            sReleaseDate: '2023-03-14',
            sStatus: 'Release',
            sOverview: 'Overview Spider man vs Doctor Strange',
            sSpokenLanguage: 'en',
            lmGenres: [],
          );
        } else {
          return MovieDetailsModel(
            sMovieName: 'The Nun',
            sReleaseDate: '2023-09-01',
            sStatus: 'Release',
            sOverview: 'Overview Nun vs Doctor Strange',
            sSpokenLanguage: 'en',
            lmGenres: [],
          );
        }
      },
    );
  }
}
