import 'package:flutter/material.dart';

void main() {
  runApp(const CounterApp());
}

class CounterApp extends StatefulWidget {
  const CounterApp({super.key});

  @override
  State<CounterApp> createState() => _CounterAppState();
}
class _CounterAppState extends State<CounterApp> {
  int count=0;

  void increaseCount(){
    setState(() {
      count++;
    });
  }
  bool isdark=false;

  void darkMode(){
    setState(() {
      isdark=!isdark;
    });
  }
  int likes=10;
  void addLikes(){
    setState((){
      likes++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: isdark ? ThemeMode.dark : ThemeMode.light,

      theme: ThemeData(brightness: Brightness.light),

      darkTheme: ThemeData(brightness: Brightness.dark),

      home: Scaffold(
        appBar: AppBar(title: Text('Counter')),

        body:Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Count: $count',
                style: TextStyle(fontSize: 20),
              ),
              Text(
                isdark?'Dark Mode Enable':'Light Mode Enable',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 20),
              Icon(Icons.favorite, color: Colors.red, size: 50),
              Text("$likes Likes"),
              SizedBox(height:20),
              ElevatedButton(onPressed: addLikes, child: Text('Add Likes')),
              SizedBox(height:20),

              ElevatedButton(
                onPressed: darkMode,
                child: Text('Toggle Dark Mode'),
              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: increaseCount,
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}