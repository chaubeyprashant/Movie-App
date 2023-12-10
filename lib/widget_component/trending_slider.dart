import 'package:carousel_slider/carousel_slider.dart';
import '../views/detail_page.dart';
import '../API/app_constants.dart';
import 'package:flutter/material.dart';

class TrendingSlider extends StatelessWidget {
  const TrendingSlider({
    super.key,
    required this.snapshot,
  });

  final AsyncSnapshot snapshot;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: snapshot.data!.length,
      itemBuilder: (context, index) => GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailPage(
                movie: snapshot.data[index],
                snapshot: snapshot
              ),
            ),
          );
        },
        child: Container(
          width: 150,
          height: 350,
          padding: const EdgeInsets.all(16),
          child: Image.network(
            '${AppConstant.imageUrlW500}${snapshot.data![index].posterPath}',
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
