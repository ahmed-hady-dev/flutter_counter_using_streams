import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Counter Stream',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CounterPage(),
    );
  }
}

class CounterPage extends StatefulWidget {
  @override
  _CounterPageState createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  int _counter = 0;
  StreamController<int> _controller = StreamController<int>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter using Stream'),
        centerTitle: true,
      ),
      body: Center(
        child: StreamBuilder(
            stream: _controller.stream,
            initialData: _counter,
            builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'You have pushed the button this many times:',
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    _counter.toString(),
                    style: TextStyle(fontSize: 32),
                  ),
                ],
              );
            }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _controller.sink.add(++_counter);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
