import 'package:flutter/material.dart';
import 'package:smv_app/chapter.dart';
import 'package:smv_app/chapter_display_page.dart';
import 'package:smv_app/home_page.dart';

class ChapterPage extends StatefulWidget{
  ChapterPage({super.key, required this.chapters, required this.title});

  List<Chapter> chapters; 
  String title;

  @override
  State<StatefulWidget> createState()  => _ChapterPageState();

}


class _ChapterPageState extends State<ChapterPage> {


  _pushChapter() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => ChapterDisplayPage(chapter: widget.chapters[0], chpg: ChapterPage(chapters: widget.chapters, title: widget.title))));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title, 
                    style: const TextStyle(
                          fontWeight: FontWeight.bold, 
                          color: Colors.blueGrey
                    )
                  ),
            automaticallyImplyLeading: false,
            actions: [IconButton(
              icon: const Icon(Icons.close),
              tooltip: 'Close',
              alignment: Alignment.centerLeft,
              onPressed: () {
                Navigator.push(context, PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) => HomePage(),
                  transitionDuration: const Duration(seconds: 0), // No transition animation
                ),);
              },
              ) ,
            ],
        ),
        body: Center(
            child: ListView(
                children: <Widget>[
                    const SizedBox(height: 100),
                    FloatingActionButton(  
                      onPressed: _pushChapter,  
                      //TODO change to actually get ALL chapter names
                      child: Text('Chapter ${widget.chapters[0].getId()}', style: const TextStyle(fontSize: 20.0),),  
                    ),  
                ],
            ),
        ),

    );




    }

}