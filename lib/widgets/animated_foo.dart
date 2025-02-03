
import 'package:flutter/material.dart';

class AnimatedFoo extends StatefulWidget {
  const AnimatedFoo({super.key});

  @override
  State<AnimatedFoo> createState() => _AnimatedFooState();
}

class _AnimatedFooState extends State<AnimatedFoo> {
  double _height = 100;
  double _width = 200;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            AnimatedContainer(
              duration:const Duration(seconds: 5,),
              curve: Curves.easeInOut,//optional average values
              height: _height,//initial state
              width: _width,//initial state
              color: Colors.blue,                         
            ),
          const  SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  if (_height == 100) {
                    _height = 200;//end state
                    _width = 400;//end state
                  } else {
                    _height = 100;//end state
                    _width = 200;//end state
                  }
               
                });
              },style:const ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(Colors.blue),
              ),
              child: Text('Animate'),
            ),                                        
          ],
        ),
      ),
    );
  }
}
