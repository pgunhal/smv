import 'package:flutter/material.dart';
import 'package:smv_app/chapter.dart';
import 'package:smv_app/chapter_page.dart';



class HomePage extends StatefulWidget {
  HomePage({super.key});

  final List<Chapter> chapters = [Chapter(file_path: 'ch1.txt', id: 1), Chapter(file_path: 'ch2.txt', id: 2)];

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  void _pushNext() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => ChapterPage(chapters: widget.chapters, title: 'shrI madhva vijaya',)));

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('shrI madhva vijaya', 
                    style: const TextStyle(
                          fontWeight: FontWeight.bold, 
                          color: Colors.blueGrey
                    )
                  ),
      ),
      body: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Padding(padding: EdgeInsets.all(10)),
            Text(
              '|| shrI gurubhyO namaha ||\n|| parama gurubhyO namaha ||\n|| shrImadAnaMda tIrtha gurubhyO namaha ||',
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,

            ),
            const Padding(padding: EdgeInsets.all(20)),

            const Image(image: AssetImage('assets/images/madhvacharya.jpg')),
            
            const Padding(padding: EdgeInsets.all(20)),

            Text(
              'Read the authentic biography of jagadguru shrI madhvAcharya below!',
              style: Theme.of(context).textTheme.headlineSmall,
              textAlign: TextAlign.center,
            ),

            const Padding(padding: EdgeInsets.all(20)),

            ElevatedButton(
              onPressed: _pushNext,
              child: const Text('Continue'), 
            ),
          ],
        ),
      
    );
  }
}
