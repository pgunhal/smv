import 'package:flutter/material.dart';
import 'package:smv_app/chapter.dart';
import 'package:smv_app/shloka.dart';
import 'package:smv_app/shloka_page.dart';

class ChapterDisplayPage extends StatefulWidget{
  ChapterDisplayPage({super.key, required this.chapter});

  Chapter chapter;

  State<StatefulWidget> createState()  => _ChapterDisplayPageState();

}


class _ChapterDisplayPageState extends State<ChapterDisplayPage> {


  Future<dynamic> _pushShloka() async {
    List<Shloka> shlokas = await widget.chapter.getShlokas();
    Shloka use = shlokas[0];
    Navigator.push(context, MaterialPageRoute(builder: (context) => ShlokaPage(shloka: use,)));
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
                children: <Widget>[
                    const SizedBox(height: 100),
                    FloatingActionButton(  
                      onPressed: _pushShloka,  
                      //TODO change to actually get ALL chapter names
                      child: Text('Chapter ${widget.chapter.getShlokas()}', style: TextStyle(fontSize: 20.0),),  
                    ),  
                ],
            ),
        ),

    );




    }

}