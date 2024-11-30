import 'package:flutter/material.dart';
import 'package:smv_app/chapter.dart';
import 'package:smv_app/shloka.dart';
import 'package:smv_app/shloka_page.dart';

class ChapterDisplayPage extends StatefulWidget{

  Chapter chapter;
  late int verses;


  ChapterDisplayPage({super.key, required this.chapter}) {
      verses = chapter.getVerseCount();
  }


  @override
  State<StatefulWidget> createState()  => _ChapterDisplayPageState();

}


class _ChapterDisplayPageState extends State<ChapterDisplayPage> {

  List<FloatingActionButton> verseList = [];


  Future<dynamic> _pushShloka(int num) async {
    List<Shloka> shlokas = await widget.chapter.getShlokas();
    Shloka use = shlokas[num];
    Navigator.push(context, MaterialPageRoute(builder: (context) => ShlokaPage(shloka: use, ch: widget.chapter)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text('Chapter: ${widget.chapter.id}', 
                    style: const TextStyle(
                          fontWeight: FontWeight.bold, 
                          color: Colors.blueGrey
                    )
                  ),
        ),
        body: Center(
            child: ListView(
                children: _listShlokas(),
            ),
        ),

    );




  }


  List<Widget> _listShlokas() {
    List<Widget> list = [];

    for(int i = 0; i < widget.verses; i++) {
      list.add(const SizedBox(height: 10));
      list.add(FloatingActionButton(
          onPressed: () => _pushShloka(i),
          child: Text('Verse ${i+1}', style: const TextStyle(fontSize: 20.0))
      ));
    }

    return list;


  }

}