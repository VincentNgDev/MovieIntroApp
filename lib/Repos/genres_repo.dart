import '../helpers/enum_helper.dart';
import '../models/movies/genres_model.dart';

abstract class GenresRepo {
  factory GenresRepo({RepoType repoType = RepoType.mockData}) {
    switch (repoType) {
      case RepoType.apiData:
        return GenresApi();
      case RepoType.mockData:
        return GenresMock();
    }
  }

  Future<List<GenresModelDTO>> get();
  Future create();
  Future update();
  Future delete();
}

class GenresApi implements GenresRepo {
  @override
  Future<List<GenresModelDTO>> get() async {
    return [];
  }

  @override
  Future create() async {}

  @override
  Future update() async {}

  @override
  Future delete() async {}
}

class GenresMock implements GenresRepo {
  @override
  Future<List<GenresModelDTO>> get() async {
    return await Future.delayed(const Duration(seconds: 2), () {
      List<GenresModel> tempGenres = [];
      tempGenres.addAll([
        GenresModel(genresId: 1, name: 'Comedy'),
        GenresModel(genresId: 2, name: 'Action'),
      ]);

      List<GenresModelDTO> tempGenresDTO = [];
      for (var genres in tempGenres) {
        tempGenresDTO.add(GenresModelDTO(
          mdlGenres: genres,
          bIsSelected: false,
        ));
      }

      return tempGenresDTO;
    });
  }

  @override
  Future create() async {}

  @override
  Future update() async {}

  @override
  Future delete() async {}
}