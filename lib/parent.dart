import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Parent Managing Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const ParentManaging(title: 'Parent Managing Demo'),
    );
  }
}

class ParentManaging extends StatefulWidget {
  const ParentManaging({super.key, required this.title});

  final String title;

  @override
  State<ParentManaging> createState() => _ParentManagingState();
}

class _ParentManagingState extends State<ParentManaging> {
  double _width = 300, _height = 400;
  bool _tapped = false;
  Color _color = Colors.grey;

  void _handleTapParent(bool isTapped) {
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
      _tapped = isTapped;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: ChildWidget(
          onChanged: _handleTapParent,
          color: _color,
          height: _height,
          width: _width,
          tapped: _tapped,
        ));
  }
}

class ChildWidget extends StatelessWidget {
  ChildWidget({
    super.key,
    this.tapped = false,
    this.height = 400,
    this.color = Colors.grey,
    this.width = 300,
    required this.onChanged,
  });

  bool tapped;
  Color color;
  double height, width;
  ValueChanged<bool> onChanged;

  void _handleTap() {
    onChanged(!tapped);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text('CHILD WIDGET'),
        ),
        body: GestureDetector(
          onTap: _handleTap,
          child: Container(
            color: color,
            width: width,
            height: height,
            child: Center(
                child: Text(
              "Hi Buddy!!",
              style: TextStyle(fontSize: 32, color: Colors.white),
            )),
          ),
        ));
  }
}
