import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../helpers/color_pick.dart';
import '../controllers/movie_details_controller.dart';

class MoviePosterCard extends StatefulWidget {
  const MoviePosterCard({
    super.key,
    required this.iMovieId,
  });
  final int iMovieId;

  @override
  State<MoviePosterCard> createState() => _MoviePosterCardState();
}

class _MoviePosterCardState extends State<MoviePosterCard> {
  @override
  void initState() {
    print('Init ${widget.iMovieId}');
    MovieDetailsController movieDetailsController =
        Get.put(MovieDetailsController());
    movieDetailsController.getMovieDetails(widget.iMovieId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    MovieDetailsController movieDetailsController =
        Get.put(MovieDetailsController());
    return Container(
      width: MediaQuery.sizeOf(context).width,
      height: MediaQuery.sizeOf(context).height,
      color: Colors.transparent,
      child: Obx(() {
        return Stack(
          fit: StackFit.expand,
          children: [
            Container(
              child: Image.asset(
                'assets/images/movie1.jpg',
                fit: BoxFit.cover,
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  color: ColorPick.topBgdColor.withOpacity(.8),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 10,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          movieDetailsController.movieDetail.value?.sMovieName ?? 'Movie Name',
                          style: TextStyle(
                            color: ColorPick.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: ColorPick.black.withOpacity(.7),
                        ),
                        child: Transform.rotate(
                          angle: -22 / 28,
                          child: Icon(
                            Icons.expand_rounded,
                            size: 30,
                            color: ColorPick.white.withOpacity(.8),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        );
      }),
    );
  }
}
