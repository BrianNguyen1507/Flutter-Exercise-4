import 'package:flutter/material.dart';

class ChangeColors extends StatefulWidget {
  const ChangeColors({super.key});

  @override
  State<ChangeColors> createState() => _ChangeColorsState();
}

class _ChangeColorsState extends State<ChangeColors> {
  Color c1Image1 = Colors.red;
  Color c2Image1 = Colors.blue;

  Color c1Image2 = Colors.black;
  Color c2Image2 = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Center(
                child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        TweenAnimationBuilder(
          tween: ColorTween(begin: c1Image1, end: c2Image1),
          duration: const Duration(milliseconds: 1200),
          builder: (_, Color? color1, __) {
            return ColorFiltered(
              colorFilter: ColorFilter.mode(color1!, BlendMode.modulate),
              child: SizedBox(
                height: 150,
                width: 150,
                child: Image.asset('assets/images/bird.png'),
              ),
            );
          },
        ),
        TweenAnimationBuilder(
          tween: ColorTween(begin: c1Image2, end: c2Image2),
          duration: const Duration(milliseconds: 1200),
          builder: (_, Color? color2, __) {
            return ColorFiltered(
              colorFilter: ColorFilter.mode(color2!, BlendMode.modulate),
              child: SizedBox(
                height: 150,
                width: 150,
                child: Image.asset('assets/images/bird.png'),
              ),
            );
          },
        ),
        MaterialButton(
          onPressed: () {
            setState(() {
              c1Image1 = c2Image1 == Colors.red ? Colors.blue : Colors.red;
              c2Image1 =
                  c2Image1 == Colors.blue ? Colors.red : Colors.blue;

              c1Image2 = c2Image2 == Colors.white ? Colors.black : Colors.white;
              c2Image2 = c2Image2 == Colors.black ? Colors.white : Colors.black;
            });
          },
          color: Colors.orange,
          splashColor: Colors.grey,
          child: const Text('Change colors'),
        ),
      ],
    ))));
  }
}
