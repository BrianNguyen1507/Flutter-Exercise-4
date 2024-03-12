import 'dart:math';

import 'package:flutter/material.dart';

class ExerciseAnimation extends StatefulWidget {
  const ExerciseAnimation({super.key});

  @override
  State<ExerciseAnimation> createState() => _ExerciseAnimationState();
}

class _ExerciseAnimationState extends State<ExerciseAnimation>
    with TickerProviderStateMixin {


  //Arrow n heard animation
  late Animation _arrowAnimation, _heardAnimation;
  late AnimationController _arrowAnimationController, _heardAnimationController;
  @override
  void initState() {
    super.initState();
    _arrowAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    _arrowAnimation =
        Tween(begin: 0.0, end: pi).animate(_arrowAnimationController);
    _heardAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );
    _heardAnimation = Tween(begin: 150.0, end: 170.0).animate(CurvedAnimation(
        parent: _heardAnimationController, curve: Curves.bounceInOut));
    _heardAnimationController.addStatusListener((AnimationStatus status) {
      if (status == AnimationStatus.completed) {
        _heardAnimationController.repeat(reverse: true);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Align(
          alignment: Alignment.center,
          child: Text(
            "Animation",
            style: TextStyle(
              color: Colors.blue,
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            renderArrow(),
            renderHeard(),
          ],
        ),
      ),
    );
  }

  Widget renderArrow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        AnimatedBuilder(
          animation: _arrowAnimationController,
          builder: (context, child) => Transform.rotate(
            angle: _arrowAnimation.value,
            child: const Icon(
              Icons.arrow_back,
              size: 50,
              color: Colors.red,
            ),
          ),
        ),
        MaterialButton(
          color: Colors.blue,
          onPressed: () {
            _arrowAnimationController.isCompleted
                ? _arrowAnimationController.reverse()
                : _arrowAnimationController.forward();
          },
          splashColor: Colors.green,
          child: const Text("Rotate arrow"),
        )
      ],
    );
  }

  Widget renderHeard() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Expanded(
          child: AnimatedBuilder(
            animation: _heardAnimationController,
            builder: (context, child) {
              return Center(
                child: Container(
                  alignment: Alignment.center,
                  child: Icon(
                    Icons.favorite,
                    color: Colors.pink,
                    size: _heardAnimation.value,
                  ),
                ),
              );
            },
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: MaterialButton(
              color: Colors.pink,
              splashColor: Colors.yellow,
              onPressed: () {
                _heardAnimationController.forward();
              },
              child: const Text("Heard beat"),
            ),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
    _arrowAnimationController.dispose();
    _heardAnimationController.dispose();
  }
}
