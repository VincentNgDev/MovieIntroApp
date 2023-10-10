import 'package:flutter/material.dart';
import 'package:flutter_baseline/helpers/color_pick.dart';
import 'package:get/get.dart';

import '../controllers/genres_controller.dart';
import '../controllers/movie_list_controllers.dart';

class FilterList extends StatefulWidget {
  const FilterList({super.key});

  @override
  State<FilterList> createState() => _FilterListState();
}

class _FilterListState extends State<FilterList> {
  @override
  Widget build(BuildContext context) {
    GenresController genresController = Get.put(GenresController());
    MovieListController movieListController = Get.put(MovieListController());
    return Container(
      height: 60,
      color: ColorPick.topBgdColor,
      child: Row(
        children: [
          const SizedBox(width: 10),
          InkWell(
            onTap: () {
              movieListController.sortByLatestReleaseDate();
            },
            child: Icon(
              Icons.sort_sharp,
              color: ColorPick.white,
              size: 26,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Obx(() {
              return ListView.builder(
                scrollDirection: Axis.horizontal,
                physics: const AlwaysScrollableScrollPhysics(
                  parent: BouncingScrollPhysics(),
                ),
                itemCount: genresController.genresList.length,
                itemBuilder: (context, index) {
                  var genres = genresController.genresList[index];
                  String genresName = genres.mdlGenres.name;
                  bool bIsSelected = genres.bIsSelected;
                  return UnconstrainedBox(
                    child: Container(
                      margin: const EdgeInsets.only(left: 8),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: bIsSelected
                            ? ColorPick.selectedGenres
                            : ColorPick.unselectedGenres,
                      ),
                      child: Text(
                        genresName,
                        style: TextStyle(
                          color: ColorPick.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}
