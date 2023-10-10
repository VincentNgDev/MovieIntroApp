class MovieListModel {
  int iMovieId;
  double dRate;
  String sMovieName;
  String sOverview;
  String sReleaseDate;
  String sPosterPath;
  String sLanguage;
  List<Map<String, dynamic>> lmGenresId;

  MovieListModel({
    required this.iMovieId,
    required this.dRate,
    required this.sMovieName,
    required this.sOverview,
    required this.sReleaseDate,
    required this.sPosterPath,
    required this.sLanguage,
    required this.lmGenresId,
  });

  factory MovieListModel.fromJson(Map<String, dynamic> json) {
    return MovieListModel(
      iMovieId: json['id'] ?? 0,
      dRate: (json['vote_average'] ?? 0.0) / 10,
      sMovieName: json['original_title'] ?? '',
      sOverview: json['overview'] ?? '',
      sReleaseDate: json['release_date'] ?? '',
      sPosterPath: json['poster_path'] ?? '',
      sLanguage: json['original_language'] ?? '',
      lmGenresId: json['genre_ids'] ?? [],
    );
  }
}
