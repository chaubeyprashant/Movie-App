import 'package:flutter/material.dart';
import '../model/movie_model.dart';
import '../API/app_constants.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({required this.movie, required this.snapshot});

  final Results movie;
  final AsyncSnapshot snapshot;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black45,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    height: 150,
                    width: double.infinity,
                    child: Image.network(
                      '${AppConstant.imageUrlW500}${movie.backdropPath}',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    height: 150,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.center,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.black,
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 10,
                    left: 15,
                    child: Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(right: 5),
                        child: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(
                            Icons.arrow_back_ios_new_rounded,
                            size: 15,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 10,
                    right: 15,
                    child: Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(right: 5),
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.close,
                            size: 15,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Text(
                movie.title.toString(),
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: [
                  Text(
                    movie.voteAverage.toString().replaceAll('.', '') +
                        "% match",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.green,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    movie.releaseDate.toString(),
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              ElevatedButton(
                style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                        )
                    )
                ),
                onPressed: (() => {}),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.play_arrow, color: Colors.black,),
                    SizedBox(width: 10,),
                    Text("Play", style: TextStyle(color: Colors.black),),
                  ],
                ),
              ),
              ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.grey),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                        )
                    )
                ),
                onPressed: (() => {}),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.file_download_outlined, color: Colors.white,),
                    SizedBox(width: 10,),
                    Text("Download", style: TextStyle(color: Colors.white),),
                  ],
                ),
              ),
              SizedBox(height: 20,),
              Text(
                movie.overview.toString(),
                maxLines: 3,
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Icon(Icons.add, color: Colors.white,),
                        SizedBox(height: 5,),
                        Text("My List", style: TextStyle(color: Colors.white),)
                      ],
                    ),
                    Column(
                      children: [
                        Icon(Icons.thumb_up_alt_outlined, color: Colors.white,),
                        SizedBox(height: 5,),
                        Text("Rate", style: TextStyle(color: Colors.white),)
                      ],
                    ),
                    Column(
                      children: [
                        Icon(Icons.send, color: Colors.white,),
                        SizedBox(height: 5,),
                        Text("Share", style: TextStyle(color: Colors.white),)
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Divider(height: 10,thickness: 5, color: Colors.red, endIndent: 280,),
              SizedBox(height: 10,),
              Text("More like this", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: Colors.white),),
              Expanded(child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, // number of items in each row
                  mainAxisSpacing: 8.0, // spacing between rows
                  crossAxisSpacing: 8.0, // spacing between columns
                ),
                padding: EdgeInsets.all(8.0), // padding around the grid
                itemCount: snapshot.data!.length, // total number of items
                itemBuilder: (context, index) {
                  return Container(
                    color: Colors.blue, // color of grid items
                    child: Center(
                      child: Image.network(
                          '${AppConstant.imageUrlW500}${snapshot.data![index].posterPath}'
                      ),
                    ),
                  );
                },
              ),),
            ],
          ),
        ),
      ),
    );
  }
}
