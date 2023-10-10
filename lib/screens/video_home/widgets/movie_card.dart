import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_baseline/helpers/color_pick.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

import '../../movie_detail/movie_details.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({
    super.key,
    required this.iMovieId,
    required this.sMovieName,
    required this.dRate,
    required this.sReleaseDate,
  });

  final int iMovieId;
  final String sMovieName;
  final double dRate;
  final String sReleaseDate;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(() => MovieDetails(iMovieId: iMovieId));
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: ColorPick.black.withOpacity(.5),
                offset: const Offset(1, 1),
                blurRadius: 1,
                spreadRadius: 1,
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child:
                    // Image.asset(
                    //   'assets/images/movie1.jpg',
                    //   fit: BoxFit.cover,
                    // ),
                    Container(
                  color: ColorPick.topBgdColor.withOpacity(.4),
                  child: CachedNetworkImage(
                    fit: BoxFit.cover,
                    imageUrl:
                        "https://i.etsystatic.com/13367669/r/il/8a5adc/3650359316/il_570xN.3650359316_ag0h.jpg",
                    placeholder: (context, url) => const Center(
                      child: CircularProgressIndicator(),
                    ),
                    errorWidget: (context, url, error) => const Icon(Icons.error),
                  ),
                ),
              ),
              Container(
                color: ColorPick.topBgdColor,
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    Text(
                      sMovieName,
                      style: TextStyle(
                        color: ColorPick.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      width: double.infinity,
                      child: RatingBarIndicator(
                        rating: dRate * 5,
                        itemBuilder: (context, index) => Icon(
                          Icons.star,
                          color: ColorPick.rateColor,
                        ),
                        itemCount: 5,
                        itemSize: 20,
                        direction: Axis.horizontal,
                        physics: const NeverScrollableScrollPhysics(),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      sReleaseDate,
                      style: TextStyle(
                        color: ColorPick.white,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 10),
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
