import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Self Managing Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SelfManaging(title: 'Self Managing Demo'),
    );
  }
}

class SelfManaging extends StatefulWidget {
  const SelfManaging({super.key, required this.title});

  final String title;

  @override
  State<SelfManaging> createState() => _SelfManagingState();
}

class _SelfManagingState extends State<SelfManaging> {
  double _width = 300, _height = 400;
  bool _tapped = false;
  Color _color = Colors.grey;

  void _handleTap() {
    setState(() {
      if (_tapped) {
        _width = 400;
        _height = 600;
        _color = Colors.black;
      } else {
        _width = 300;
        _height = 400;
        _color = Colors.grey;
      }
      _tapped = !_tapped;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: GestureDetector(
          onTap: _handleTap,
          child: Container(
            color: _color,
            width: _width,
            height: _height,
            child: Center(
                child: Text(
              "Hi Buddy!!",
              style: TextStyle(fontSize: 32, color: Colors.white),
            )),
          ),
        ));
  }
}
