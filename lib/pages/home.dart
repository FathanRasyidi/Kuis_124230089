import 'package:flutter/material.dart';
import 'package:kuis_124230089/pages/detail.dart';
import '/pages/login.dart';
import '/data/movie_data.dart';

class HomePage extends StatefulWidget {
  final String username;
  const HomePage({super.key, required this.username});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<bool> bookmark = [false, false, false, false,false, false,false, false,false, false,false, false,false, false,false, false];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        actionsPadding: EdgeInsets.all(20),
        backgroundColor: Colors.white,
        scrolledUnderElevation: 0,
        toolbarHeight: 80,
        title: Row(
          children: [
            SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Selamat Datang, ${widget.username}!',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  Text(
                    'Kuis Praktikum Mobile SI-A',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => LoginPage()), (Route<dynamic> route) => false);
            },
            child: Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
          color: Colors.red.shade50,
          borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(Icons.logout, size: 16, color: Colors.red.shade600),
            ),
          ),
        ],
      ),
      body: Padding(padding: EdgeInsets.symmetric(horizontal: 20),
      child: ListView.builder(
        itemBuilder: (context, index) {
        return Container(
        margin: EdgeInsets.only(top: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey.shade300, width: 1),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade100,
              blurRadius: 8,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: ListTile(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => DetailPage(index: index)));
          },
          contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          leading: Image.network(movieList[index].imgUrl,),
          title: Text(
            movieList[index].title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.grey.shade800,
            ),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                movieList[index].genre,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.blue.shade600,
                ),
              ),
              SizedBox(height: 2),
              Row(
                children: [
                  Text("⭐"),
                  SizedBox(width: 5,),
                  Text(
                    movieList[index].rating.toString(),
                    style: TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
          ),
          trailing: IconButton(onPressed: () {
            bookmark[index] ?
            setState(() {
              bookmark[index] = false;
            }) : setState(() {
              bookmark[index] = true;
            });
          },
          icon: bookmark[index] ? Icon(Icons.bookmark, color: Colors.blue.shade300) : Icon(Icons.bookmark_outline)),
        ),
      );
        },
        itemCount: movieList.length,),),
    );
  }
}

// Icon(Icons.bookmark, color: Colors.blue.shade300)