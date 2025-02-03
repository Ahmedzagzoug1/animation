import 'package:flutter/material.dart';

class TweenAnimation extends StatefulWidget {
  const TweenAnimation({super.key});

  @override
  State<TweenAnimation> createState() => _TweenAnimationState();
}

class _TweenAnimationState extends State<TweenAnimation> {
  @override
  Widget build(BuildContext context) {
   List<String> names = ['Flutter','Dart','Java','Kotlin','Python','Swift','JavaScript','PHP','C#','Ruby',
    'Flutter','Dart','Java','Kotlin','Python','Swift','JavaScript','PHP','C#','Ruby',];
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TweenAnimationBuilder(tween: IntTween(begin: 0,end: names.length-1),
       duration:const Duration(seconds: 50),
       curve: Curves.easeInOutSine,
       child: Container(//the child does not animate  
         color: Colors.blue,
         width: 200,
         height: 200),
        builder: (BuildContext context, int value, Widget? child) {
         return Center(
           child: Text(names[ value],//child has been animated from start to end
           style: TextStyle(fontSize: 100,color: Colors.red),),
         );
       }),
    );
  }
}
