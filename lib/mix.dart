import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mix Managing Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MixManaging(title: 'Mix Managing Demo'),
    );
  }
}

class MixManaging extends StatefulWidget {
  const MixManaging({super.key, required this.title});

  final String title;

  @override
  State<MixManaging> createState() => _MixManagingState();
}

class _MixManagingState extends State<MixManaging> {
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

class ChildWidget extends StatefulWidget {
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

  @override
  State<ChildWidget> createState() => _ChildWidget();
}

class _ChildWidget extends State<ChildWidget> {
  bool _highlighted = false;

  void _handleTapUp(TapUpDetails details) {
    setState(() {
      _highlighted = false;
    });
  }

  void _handleTapDown(TapDownDetails details) {
    setState(() {
      _highlighted = true;
    });
  }

  void _handleDoubleTap() {
    widget.onChanged(!widget.tapped);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text('CHILD WIDGET'),
        ),
        body: GestureDetector(
          onTapUp: _handleTapUp,
          onTapDown: _handleTapDown,
          onDoubleTap: _handleDoubleTap,
          child: Container(
            decoration: BoxDecoration(
              color: widget.tapped ? Colors.red : Colors.green,
              border: _highlighted
                  ? Border.all(color: Colors.black, width: 10)
                  : null,
            ),
            width: widget.width,
            height: widget.height,
            child: Center(
                child: Text(
              "Hi Buddy!!",
              style: TextStyle(fontSize: 32, color: Colors.white),
            )),
          ),
        ));
  }
}
