class GenresModel {
  int genresId;
  String name;
  GenresModel({
    required this.genresId,
    required this.name,
  });
}

class GenresModelDTO {
  GenresModel mdlGenres;
  bool bIsSelected;
  GenresModelDTO({
    required this.mdlGenres,
    required this.bIsSelected,
  });
}
