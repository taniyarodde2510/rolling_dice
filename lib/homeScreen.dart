import 'package:flutter/material.dart';
import 'dart:math';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {

int leftDiceNo = 1;
int rightDiceNo = 2;
 late AnimationController _controller;



  @override
void initState()
{
super.initState();
animated();
}

@override
void dispose()
{
  super.dispose();
  _controller.dispose();
}

animated()
{
 _controller = AnimationController(duration: Duration(seconds: 1),vsync: this);

_controller.addListener(() {

  setState(() {
    
  });
  print(_controller.value);
  });
_controller.addStatusListener((status) {if(status==AnimationStatus.completed)
{

   setState(() {
      leftDiceNo=Random().nextInt(6) +1;
      rightDiceNo=Random().nextInt(6) +1;
  });


  print('Completed');
  _controller.reverse();
}

});
}

  void roll(){

    _controller.forward();

   }
  











  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Playing with Dices'),
      ),
      body:  Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                GestureDetector(
                  onDoubleTap: roll,
                  child: Image(height: 200 - (_controller.value)*200,
                    image: AssetImage('assets/images/dice-$leftDiceNo.png'),
                  ),
                ),
                GestureDetector(
                   onDoubleTap: roll,
                  child: Image(height: 200 - (_controller.value)*200,
                    image: AssetImage('assets/images/dice-$rightDiceNo.png')
                    )
                    )
              ],
            ),
            FilledButton(onPressed: roll, child: Text('Roll'),)
          ],
        ),
      ),
    );
  }




}
