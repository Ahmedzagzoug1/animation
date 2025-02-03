import 'package:animation/widgets/animated_foo.dart';
import 'package:animation/widgets/custom_animated_builder.dart';
import 'package:animation/widgets/foo_transition.dart';
import 'package:animation/widgets/foo_transition_with_two_widgets.dart';
import 'package:animation/widgets/tween_animation.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(mainAxisAlignment: MainAxisAlignment.end,children: [
                const  Expanded(child: SizedBox()),
          const Icon(Icons.home),
          SizedBox(width: 60),
           IconButton(icon:Icon( Icons.nights_stay), onPressed: () {
            Navigator.pop(context);}),
   
        ],),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body:const CustomAnimatedBuilder()
    );
  }
}