import 'package:flutter/material.dart';

class CustomAnimatedBuilder extends StatefulWidget {
  const CustomAnimatedBuilder({super.key});

  @override
  State<CustomAnimatedBuilder> createState() => _CustomAnimatedBuilderState();
}

class _CustomAnimatedBuilderState extends State<CustomAnimatedBuilder>
    with TickerProviderStateMixin {
  late Animation _animationText;
  late AnimationController _animationController;
    List<String> names = ['Flutter','Dart','Java','Kotlin','Python','Swift','JavaScript','PHP','C#','Ruby',
    'Flutter','Dart','Java','Kotlin','Python','Swift','JavaScript','PHP','C#','Ruby',];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController = AnimationController(
        vsync: this,
        duration: Duration(seconds: 10),
        reverseDuration: Duration(seconds: 3));
    _animationText =IntTween(begin:  0, end: names.length-1).animate( _animationController);
        
    _animationController.addListener(() {
      print(_animationController.value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AnimatedBuilder(
          animation: _animationText,
          builder: (context, child) {
            return Container(
              height: 200,
              width: 200,
              color: Colors.red,
              child: Text(names[_animationText.value],
                  style: const TextStyle(fontSize: 32, color: Colors.white)),
            );
          },
        ),
        const Expanded(child: SizedBox()),
        Row(
          children: [
            ElevatedButton(
                onPressed: () {
                  _animationController.forward();
                },
                child: const Text(
                  'Start',
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                )),
            ElevatedButton(
                onPressed: () {
                  _animationController.stop();
                },
                child: const Text(
                  'Stop',
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                )),
            ElevatedButton(
                onPressed: () {
                  _animationController.reverse();
                },
                child: const Text(
                  'Reverse',
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                )),
          ],
        )
      ],
    );
  }
}

class ContainerChild extends StatelessWidget {
  const ContainerChild({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text('Hello'),
        Text('World'),
        Text('Everyone'),
      ],
    );
  }
}
