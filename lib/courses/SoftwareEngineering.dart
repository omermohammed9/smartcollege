import 'package:flutter/material.dart';

class SoftwareEngineering extends StatelessWidget {
  const SoftwareEngineering({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        centerTitle: true, //false OR True
        title: const Text(
          'Software Engineering',
          style: TextStyle(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          textAlign: TextAlign.right,
        ),
        actions: [
          Container(
              child: IconButton(
                  icon: const Icon(Icons.info_rounded), onPressed: () {})),
          Container(
              child: IconButton(
                  icon: const Icon(Icons.arrow_right), onPressed: () {})),
        ],
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView(
                children: <Widget>[
                  ListTile(
                    title: Text('Concept 1'),
                  ),
                  ListTile(
                    title: Text('Concept 2'),
                  ),
                  ListTile(
                    title: Text('Concept 3'),
                  ),
                ],
              ),
            ),
            ElevatedButton(
              child: Text('Take Quiz'),
              onPressed: () {
                // navigate to quiz screen
              },
            ),
          ],
        ),
      ),
    );
  }
}
