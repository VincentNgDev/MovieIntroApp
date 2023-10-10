import 'package:flutter/material.dart';
import 'package:flutter_baseline/helpers/color_pick.dart';
import 'package:flutter_baseline/screens/video_home/widgets/filter_list.dart';
import 'package:get/get.dart';

import 'controllers/movie_list_controllers.dart';
import 'widgets/movie_card.dart';

class HomeVideoScreen extends StatefulWidget {
  const HomeVideoScreen({super.key});

  @override
  State<HomeVideoScreen> createState() => _HomeVideoScreenState();
}

class _HomeVideoScreenState extends State<HomeVideoScreen> {
  @override
  Widget build(BuildContext context) {
    MovieListController movieListController = Get.put(MovieListController());
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(10),
          child: Image.asset("assets/images/cinema.png"),
        ),
        backgroundColor: ColorPick.topBgdColor,
        title: const Text('Latest Movie'),
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Icon(
              Icons.search,
              color: ColorPick.white,
            ),
          ),
        ],
      ),
      body: Container(
        width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).height,
        child: Column(
          children: [
            const FilterList(),
            Expanded(
              child: Container(
                color: ColorPick.black,
                child: CustomScrollView(
                  primary: false,
                  physics: const AlwaysScrollableScrollPhysics(
                    parent: BouncingScrollPhysics(),
                  ),
                  slivers: [
                    const SliverToBoxAdapter(
                      child: SizedBox(height: 10),
                    ),
                    Obx(() {
                      return SliverPadding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        sliver: SliverGrid.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 7 / 15,
                            crossAxisSpacing: 15,
                            mainAxisSpacing: 15,
                          ),
                          itemCount: movieListController.movieList.length,
                          itemBuilder: (context, index) {
                            var iMovieId = movieListController.movieList[index].iMovieId;
                            var sMovieName = movieListController.movieList[index].sMovieName;
                            var dRate = movieListController.movieList[index].dRate;
                            var sReleaseDate = movieListController.movieList[index].sReleaseDate;
                            return MovieCard(
                              iMovieId: iMovieId,
                              sMovieName: sMovieName,
                              dRate: dRate,
                              sReleaseDate: sReleaseDate,
                            );
                          },
                        ),
                      );
                    }),
                    const SliverToBoxAdapter(
                      child: SizedBox(height: 10),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
