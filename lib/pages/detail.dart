import 'package:flutter/material.dart';
import '/data/movie_data.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailPage extends StatelessWidget {
  final int index;
  DetailPage({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 60,
        title: Text(
          "Movie Details",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            SizedBox(height: 20),
            Container(
              height: 600,
              child: 
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      image: DecorationImage(
                        image: NetworkImage(movieList[index].imgUrl),
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  )
            ),
            SizedBox(height: 10,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  Text("${movieList[index].title} (${movieList[index].year})", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),),
                  Text("Directed by ${movieList[index].director}", style: TextStyle(color: Colors.grey),),
                  SizedBox(height: 10,),
                  Text(movieList[index].synopsis),
                  SizedBox(height: 20,),
                  Text("Genre : ${movieList[index].genre}", style: TextStyle(fontWeight: FontWeight.w700),),
                  Text("Casts :", style: TextStyle(fontWeight: FontWeight.w700),),
                    Wrap(
                    alignment: WrapAlignment.start,
                    spacing: 8.0,
                    runSpacing: 2.0,
                    children: movieList[index].casts.map((tag) => 
                    Chip(
                      label: Text(tag, style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.blueAccent),),
                      backgroundColor: Colors.blue[100],
                      side: BorderSide.none,
                    )
                    ).toList(),
                    ),
                  
                ]
              ),
            ),
            SizedBox(height: 20,),
            Center(child: 
            Text("⭐ Rated ${movieList[index].rating}/10", style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),)),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(20),
              child: ElevatedButton(
                onPressed: () {
                  launchUrl(Uri.parse(movieList[index].movieUrl));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Center(
                  child: Text("Go to Wikipedia")),
              ),
            ),
            SizedBox(height: 5,)
            ],
          ),
        ),
      ),
    );
  }
}
