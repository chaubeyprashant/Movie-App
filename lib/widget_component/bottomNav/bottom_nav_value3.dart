import 'dart:math';
import 'package:flutter/material.dart';
import 'package:movie_app/widget_component/other_widget.dart';
import '../../API/fetch_api.dart';
import '../../model/movie_model.dart';
import '../../widget_component/upcoming_slider.dart';
import '../../widget_component/top_rated_slider.dart';
import '../../widget_component/trending_slider.dart';

class BottomPage3 extends StatefulWidget {
  const BottomPage3({
    super.key,
  });

  @override
  State<BottomPage3> createState() => _BottomPage3State();
}

late Future<List<Results>> trendingMovies;
late Future<List<Results>> topRatedMovies;

class _BottomPage3State extends State<BottomPage3> {
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
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CircleAvatar(
                    child: Icon(Icons.download),
                backgroundColor: Colors.blue,
                radius: 30,
                ),
                SizedBox(width: 10,),
                Text("Downloads", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20, color: Colors.white),),
                Spacer(),
                Icon(Icons.arrow_forward_ios, color: Colors.white,)
              ],
            ),
            SizedBox(height: 20,),
            SectionWidget(trendingMovies, "Trending"),
            SectionWidget(topRatedMovies, "TV Shows & Movies You have liked"),
            SectionWidget(trendingMovies, "My list"),
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
          height: 25,
          child: Text(categoryName, style: TextStyle(color: Colors.white, fontSize: 20),),
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
