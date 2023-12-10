import 'dart:math';
import 'package:flutter/material.dart';
import 'package:movie_app/widget_component/other_widget.dart';
import '../../API/fetch_api.dart';
import '../../model/movie_model.dart';
import '../../widget_component/upcoming_slider.dart';
import '../../widget_component/top_rated_slider.dart';
import '../../widget_component/trending_slider.dart';

class BottomPage1 extends StatefulWidget {
  const BottomPage1({
    super.key,
  });

  @override
  State<BottomPage1> createState() => _BottomPage1State();
}

late Future<List<Results>> trendingMovies;
late Future<List<Results>> topRatedMovies;

class _BottomPage1State extends State<BottomPage1> {
  @override
  void initState() {
    super.initState();
    trendingMovies = Api().getTrendingMovies();
    topRatedMovies = Api().getTopRatedMovies();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SectionWidget(trendingMovies, "Trending"),
            SectionWidget(topRatedMovies, "Top Rated"),
            SectionWidget(trendingMovies, "Trending"),
            SectionWidget(topRatedMovies, "Top Rated"),
          ],
        ),
      ),
    );
  }
}

Widget SectionWidget(Future<List<Results>> topRatedMovies, String categoryName){
  return Container(
    width: double.infinity,
    height: 250,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 20,
          child: Text(categoryName, style: TextStyle(color: Colors.white, fontSize: 15),),
        ),
        Expanded(
          child: FutureBuilder(
            future: topRatedMovies,
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Center(
                  child: Text(snapshot.error.toString()),
                );
              } else if (snapshot.hasData) {
                return TrendingSlider(
                  snapshot: snapshot,
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ),
      ],
    ),
  );
}
