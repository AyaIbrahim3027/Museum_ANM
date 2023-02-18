import 'package:floating_action_bubble/floating_action_bubble.dart';
import 'package:flutter/material.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Material App',
      home: const Home(),
      debugShowCheckedModeBanner: false, // to remove marker
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {

  Animation<double>? _animation;
  AnimationController? _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 260),
    );

    final curvedAnimation =
    CurvedAnimation(curve: Curves.easeInOut, parent: _animationController!);
    _animation = Tween<double>(begin: 0, end: 1).animate(curvedAnimation);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('3D Model'),
        backgroundColor: Colors.amber,
      ),
      body: Center(
          child: ModelViewer(
            src: 'images/Anubis.glb',
            backgroundColor: Colors.white,
            autoPlay: true,
            autoRotate: true,
            rotationPerSecond: "90deg",
            // ar: true,
          ),
      ),
      floatingActionButton: FloatingActionBubble(
        items: <Bubble>[
          Bubble(
            title: "Sign Language Video",
            iconColor: Colors.white,
            bubbleColor: Colors.black87,
            icon: Icons.sign_language_rounded,
            titleStyle: TextStyle(fontSize: 16 , color: Colors.white),
            onPress: ()
            {
              _animationController!.reverse();
            }
          ),
          Bubble(
              title: "Character Voice",
              iconColor: Colors.white,
              bubbleColor: Colors.black87,
              icon: Icons.record_voice_over_rounded,
              titleStyle: TextStyle(fontSize: 16 , color: Colors.white),
              onPress: ()
              {
                _animationController!.reverse();
              }
          ),
        ],
        animation: _animation!,
        onPress: () => _animationController!.isCompleted
            ? _animationController!.reverse()
            : _animationController!.forward(),
        backGroundColor: Colors.amber,
        iconColor: Colors.white,
        iconData: Icons.add,
      ),
    );
  }
}


