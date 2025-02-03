import 'dart:math';

import 'package:flutter/material.dart';

class FooTransitionWithTwoWidgets extends StatefulWidget {
  const FooTransitionWithTwoWidgets({super.key});

  @override
  State<FooTransitionWithTwoWidgets> createState() =>
      _FooTransitionWithTwoWidgetsState();
}

class _FooTransitionWithTwoWidgetsState
    extends State<FooTransitionWithTwoWidgets> with TickerProviderStateMixin {
  late Animation<AlignmentGeometry> _greenAnimation;
  late Animation<AlignmentGeometry> _yellowAnimation;
  late AnimationController _yellowController;
  late AnimationController _greenController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _yellowController = AnimationController(
        vsync: this,
        duration: const Duration(seconds: 10),
        reverseDuration: const Duration(seconds: 3));
    _greenController = AnimationController(
        vsync: this,
        duration: const Duration(seconds: 10),
        reverseDuration: const Duration(seconds: 3));
    _greenAnimation = Tween<AlignmentGeometry>(
            begin: Alignment.topCenter, end: Alignment.bottomCenter)
        .animate(_greenController);
    _yellowAnimation = Tween<AlignmentGeometry>(
            begin: Alignment.centerLeft, end: Alignment.centerRight)
        .animate(_yellowController);

    _yellowAnimation.value; //the real value of the animation
    _yellowController.value; // the ratio value of the animation
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _yellowController.dispose();
    _greenController.dispose(); //dispose the controller
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: Stack(
          children: [
            AlignTransition(
                alignment: _greenAnimation,
                child: const CircleAvatar(
                  backgroundColor: Colors.green,
                )),
            AlignTransition(
                alignment: _yellowAnimation,
                child: const CircleAvatar(
                  backgroundColor: Colors.yellow,
                )),
          ],
        )),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () {
                _greenController.forward();
                _greenController.addListener(listener);
              },
              child: const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'Forward',
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
//_greenController.removeListener(listener); remove listener we should use the same method tha we used to add the listener
                _greenController.reverse();
              },
              child: const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'Reverse',
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }

  void makeCircle() {
    _greenController.addStatusListener((status) {
      if (_greenController.status == AnimationStatus.completed) {
        _greenController.reverse();
      } else if (_greenController.status == AnimationStatus.dismissed) {
        _greenController.forward();
      }
    });
  }

  void transiteTwoAvaterDirectly() {
    _greenController.addStatusListener((status) {
      if (_greenController.status == AnimationStatus.completed &&
          _yellowController.status == AnimationStatus.dismissed) {
        _yellowController.forward();
      } else if (_greenController.status == AnimationStatus.dismissed &&
          _yellowController.status == AnimationStatus.completed) {
        _yellowController.reverse();
      }
    });
  }

  void transitTwoControllerUsingValue() {
    _greenAnimation.addListener(() {
      if (_greenController.value >= .5 && _yellowController.value == 0) {
        _yellowController.forward();
      } else if (_greenController.value >= 0.8 &&
          _yellowController.value == 1) {
        _yellowController.reverse();
      }
    });
  }

  void listener() {
    print(_greenAnimation.value);
  }
}
