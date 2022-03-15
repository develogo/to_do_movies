import 'package:flutter/material.dart';
import 'package:to_do_list/app/adapters/movie.dart';

class DetailsPage extends StatefulWidget {
  final Movie movie;
  const DetailsPage({Key? key, required this.movie}) : super(key: key);
  @override
  DetailsPageState createState() => DetailsPageState();
}

class DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.movie.title),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Column(
        children: <Widget>[
          Text(widget.movie.note.toString()),
          Text(widget.movie.description),
        ],
      ),
    );
  }
}
