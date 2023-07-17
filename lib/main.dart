import 'package:flutter/material.dart';

void main() => runApp(NewsFeedApp());

class NewsFeedApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News Feed',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: NewsFeedPage(),
    );
  }
}

class NewsFeedPage extends StatefulWidget {
  @override
  _NewsFeedPageState createState() => _NewsFeedPageState();
}

class _NewsFeedPageState extends State<NewsFeedPage> {
  List<String> newsArticles = [
    'News Article 1',
    'News Article 2',
    'News Article 3',
    'News Article 4',
    'News Article 5',
    'News Article 6',
    'News Article 7',
    'News Article 8',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News Feed'),
      ),
      body: OrientationBuilder(
        builder: (context, orientation) {
          return ListView.builder(
            itemCount: newsArticles.length,
            itemBuilder: (context, index) {
              return NewsArticleCard(
                imageUrl: 'https://via.placeholder.com/150', // Replace with actual image URL
                title: newsArticles[index],
              );
            },
          );
        },
      ),
    );
  }
}

class NewsArticleCard extends StatelessWidget {
  final String imageUrl;
  final String title;

  NewsArticleCard({required this.imageUrl, required this.title});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      child: Row(
        children: [
          Container(
            width: 100.0,
            height: 100.0,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: 16.0),
          Flexible(
            child: Text(
              title,
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
