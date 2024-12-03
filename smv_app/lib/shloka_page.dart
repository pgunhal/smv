import 'package:flutter/material.dart';
import 'package:smv_app/chapter.dart';
import 'package:smv_app/chapter_display_page.dart';
import 'package:smv_app/chapter_page.dart';
import 'package:smv_app/shloka.dart';

class ShlokaPage extends StatefulWidget{

  ShlokaPage({super.key, required this.shloka, required this.ch, required this.chpg});

  Shloka shloka;
  Chapter ch;
  ChapterPage chpg; 

  @override
  State<StatefulWidget> createState()  => _ShlokaPageState();

}


class _ShlokaPageState extends State<ShlokaPage> {


  void _navBefore() async{
      int id = widget.shloka.id; //
      if(id > 1) { //previous index exists (bc 0 does not exist as an index here)
        Shloka prev = await widget.ch.getShloka(id-1);
        Navigator.push(context, MaterialPageRoute(builder: (context) => ShlokaPage(shloka: prev, ch: widget.ch, chpg: widget.chpg)));
      }
  }

  void _navAfter() async {
    int id = widget.shloka.id; //
    if(id < widget.ch.getVerseCount()) { //next index exists 
        Shloka next = await widget.ch.getShloka(id+1);
        Navigator.push(context, MaterialPageRoute(builder: (context) => ShlokaPage(shloka: next, ch: widget.ch, chpg: widget.chpg)));
    }
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Verse ${widget.shloka.id}', 
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
                pageBuilder: (context, animation, secondaryAnimation) => ChapterDisplayPage(chapter: widget.ch, chpg: widget.chpg),
                transitionDuration: const Duration(seconds: 0), // No transition animation
              ),);
            },
            ) ,
          ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: ListView(
            children:<Widget>[
              const SizedBox(height: 50),
              Text(
                widget.shloka.content, 
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 34, 23, 23),
                  fontSize: 26, 
                ),
              ),
            ],
          )
        ),    
      ),


//TODO figure out how to format better AND how to fix transitions b/w pages (popups) + DRAWER
      persistentFooterButtons: [
        SizedBox (
          width: MediaQuery.of(context).copyWith().size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.bottomLeft,
                child: FloatingActionButton(onPressed: _navBefore, child: const Icon(Icons.navigate_before)),
              ),
              const SizedBox(width: 30),
              Align(
                alignment: Alignment.bottomRight,
                child: FloatingActionButton(onPressed: _navAfter, child: const Icon(Icons.navigate_next))
              ),
            ]
          ),
        )
      ],
    );
          
  }




}
