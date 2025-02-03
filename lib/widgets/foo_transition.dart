import 'package:flutter/material.dart';

class FooTransition extends StatefulWidget {
  const FooTransition({super.key});

  @override
  State<FooTransition> createState() => _FooTransitionState();
}

class _FooTransitionState extends State<FooTransition>
    with TickerProviderStateMixin {
  late Animation<AlignmentGeometry> animation_green;

  late Animation<AlignmentGeometry> animation_yellow;
  late AnimationController _animationController;
  List<String> tips = [
    'Forward',
    'Reverse',
    'Stop',
    'Reset',
    'Repeat',
    'Repeat(Reverse -no)',
    'Repeat(Reverse -no)'
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController = AnimationController(
        vsync: this,
        duration: Duration(seconds: 1),
        reverseDuration: Duration(seconds: 3));
    animation_yellow = Tween<AlignmentGeometry>(
            begin: Alignment.centerLeft, end: Alignment.centerRight)
        .animate(CurvedAnimation(parent: _animationController,
         curve: Curves.easeIn));//option
    animation_green = Tween<AlignmentGeometry>(
            begin: Alignment.topCenter, end: Alignment.bottomCenter)
        .animate(_animationController);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: Stack(
          children: [
            AlignTransition(
                alignment: animation_green,
                child: const CircleAvatar(
                  backgroundColor: Colors.green,
                )),
            AlignTransition(
                alignment: animation_yellow,
                child: const CircleAvatar(
                  backgroundColor: Colors.yellow,
                )),
          ],
        )),
        Wrap(
          children: List.generate(tips.length, (index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                padding: EdgeInsets.all(16),
                color: Colors.blue,
                child: GestureDetector(
                  onTap: () {
                    switch (index) {
                      case 0:
                        _animationController.forward();
                        break;
                      case 1:
                        _animationController.reverse();
                        break;
                      case 2:
                        _animationController.stop();
                        break;
                      case 3:
                        _animationController.reset();
                        break;
                      case 4:
                        _animationController.repeat();
                        break;
                      case 5:
                        _animationController.repeat(reverse: true);
                      default:
                    }
                  },
                  child: Text(
                    tips[index],
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            );
          }),
        )
      ],
    );
  }
}
