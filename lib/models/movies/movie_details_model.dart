class MovieDetailsModel {
  String sMovieName;
  String sReleaseDate;
  String sStatus;
  String sOverview;
  String sSpokenLanguage;
  List<Map<String, dynamic>> lmGenres;

  MovieDetailsModel({
    required this.sMovieName,
    required this.sReleaseDate,
    required this.sStatus,
    required this.sOverview,
    required this.sSpokenLanguage,
    required this.lmGenres,
  });
}