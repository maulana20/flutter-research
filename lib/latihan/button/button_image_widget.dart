import 'dart:ffi';

import 'package:flutter/material.dart';

class ButtonImageWidget extends StatefulWidget {
  String imageURL;
  Color color;

  ButtonImageWidget(
      {this.imageURL =
          "https://gentle-river-19491.herokuapp.com/img/cat_diagnosa.png",
      this.color = Colors.orangeAccent});

  @override
  _ButtonImageWidgetState createState() =>
      _ButtonImageWidgetState(imageURL: imageURL, color: color);
}

class _ButtonImageWidgetState extends State<ButtonImageWidget> {
  String imageURL;
  Color color;

  _ButtonImageWidgetState(
      {this.imageURL =
          "https://gentle-river-19491.herokuapp.com/img/cat_diagnosa.png",
      this.color = Colors.orangeAccent});

  Color _secondColor = Colors.purple;
  double _size = 70.0;
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (details) {
        setState(() {
          _isPressed = !_isPressed;
        });
      },
      onTapUp: (details) {
        setState(() {
          _isPressed = !_isPressed;
        });
      },
      onTapCancel: () {
        setState(() {
          _isPressed = !_isPressed;
        });
      },
      child: Material(
        elevation: _isPressed ? 10 : 1,
        borderRadius: BorderRadius.circular(20),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Stack(children: [
            Container(
              width: _size,
              height: _size,
              child: Transform.translate(
                offset: Offset(20, -55),
                child: SizedBox(
                  width: 10,
                  height: 10,
                  child: Material(
                    borderRadius: BorderRadius.circular(30),
                    color: _isPressed ? _secondColor : color,
                  ),
                ),
              ),
            ),
            ClipPath(
              clipper: ButtonIconClipper(),
              child: Container(
                width: _size,
                height: _size,
                decoration:
                    BoxDecoration(color: _isPressed ? _secondColor : color),
              ),
            ),
            Container(
              width: _size,
              height: _size,
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Image(
                  width: 60,
                  image: NetworkImage(imageURL),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}

class ButtonIconClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(0, size.height * 0.65);
    path.quadraticBezierTo(
        size.width * 0.35, size.height * 0.95, size.width, size.height * 0.45);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
