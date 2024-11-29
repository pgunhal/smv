import 'package:flutter/material.dart';
import 'package:smv_app/shloka.dart';

class ShlokaPage extends StatefulWidget{
  ShlokaPage({super.key, required this.shloka});

  Shloka shloka;

  State<StatefulWidget> createState()  => _ShlokaPageState();

}


class _ShlokaPageState extends State<ShlokaPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.shloka.id, 
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
                    Text(
                        widget.shloka.content, 
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Color.fromARGB(255, 34, 23, 23),
                        ),
                    ),
                ],
            ),
        ),

    );




    }

}