import '../helpers/enum_helper.dart';
import '../models/movies/movie_list_model.dart';

abstract class MovieListRepo {
  factory MovieListRepo({RepoType repoType = RepoType.mockData}) {
    switch (repoType) {
      case RepoType.apiData:
        return MovieListApi();
      case RepoType.mockData:
        return MovieListMock();
    }
  }

  Future<List<MovieListModel>> get();
}

class MovieListApi implements MovieListRepo {
  @override
  Future<List<MovieListModel>> get() async {
    return [];
  }
}

class MovieListMock implements MovieListRepo {
  @override
  Future<List<MovieListModel>> get() async {
    return await Future.delayed(
      const Duration(seconds: 2),
      () {
        return [
          MovieListModel(
            iMovieId: 123,
            dRate: 8.9 / 10,
            sMovieName: 'Spider Man',
            sOverview: 'Spider Man Home Return',
            sReleaseDate: '2024-02-25',
            sPosterPath: '',
            sLanguage: 'en',
            lmGenresId: [],
          ),
          MovieListModel(
            iMovieId: 223,
            dRate: 6.3 / 10,
            sMovieName: 'The Nun',
            sOverview: 'Horror Return',
            sReleaseDate: '2024-03-14',
            sPosterPath: '',
            sLanguage: 'en',
            lmGenresId: [],
          ),
        ];
      },
    );
  }
}
