import 'package:flutter/material.dart';
import 'package:flutter_baseline/helpers/color_pick.dart';
import 'package:get/get.dart';

import '../video_home/controllers/genres_controller.dart';
import '../video_home/controllers/movie_list_controllers.dart';
import 'widgets/movie_poster_card.dart';

class MovieDetails extends StatefulWidget {
  const MovieDetails({super.key, required this.iMovieId});
  final int iMovieId;
  @override
  State<MovieDetails> createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> {
  late PageController _pageController;
  late int _currentPage;
  // Function Section
  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      initialPage: 0,
      keepPage: true,
    );

    _pageController.addListener(_scrollListener);

    _currentPage = 0;
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  void _scrollListener() {}

  // Widget Section
  @override
  Widget build(BuildContext context) {
    MovieListController movieListController = Get.put(MovieListController());
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: MediaQuery.sizeOf(context).width,
          height: MediaQuery.sizeOf(context).height,
          color: ColorPick.black,
          child: Stack(
            children: [
              Obx(
                () => PageView.builder(
                  controller: _pageController,
                  physics: const AlwaysScrollableScrollPhysics(
                    parent: BouncingScrollPhysics(),
                  ),
                  scrollDirection: Axis.vertical,
                  itemCount: movieListController.movieList.length,
                  itemBuilder: (context, index) {
                    var iMovieId = movieListController.movieList[index].iMovieId;
                    return MoviePosterCard(
                      iMovieId: iMovieId,
                    );
                  },
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: Container(
                        width: 48,
                        height: 48,
                        margin: const EdgeInsets.only(top: 10, left: 10),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: ColorPick.white.withOpacity(.5),
                          boxShadow: [
                            BoxShadow(
                              color: ColorPick.black.withOpacity(.5),
                              offset: const Offset(1, 1),
                              blurRadius: 1,
                              spreadRadius: 1,
                            ),
                          ],
                        ),
                        child: Icon(
                          Icons.arrow_back_rounded,
                          color: ColorPick.black,
                          size: 28,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
