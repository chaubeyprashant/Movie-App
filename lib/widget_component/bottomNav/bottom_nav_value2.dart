import 'dart:math';
import 'package:flutter/material.dart';
import 'package:movie_app/widget_component/other_widget.dart';
import '../../API/fetch_api.dart';
import '../../model/movie_model.dart';
import '../../widget_component/upcoming_slider.dart';
import '../../widget_component/top_rated_slider.dart';
import '../../widget_component/trending_slider.dart';

class BottomPage2 extends StatefulWidget {
  const BottomPage2({
    super.key,
  });

  @override
  State<BottomPage2> createState() => _BottomPage2State();
}

late Future<List<Results>> topRatedMovies;

class _BottomPage2State extends State<BottomPage2> {
  @override
  void initState() {
    super.initState();
    topRatedMovies = Api().getTopRatedMovies();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.black,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: FutureBuilder(
                future: topRatedMovies,
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Center(
                      child: Text(snapshot.error.toString()),
                    );
                  } else if (snapshot.hasData) {
                    return TopRatedSlider(
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
      ),
    );
  }
}
