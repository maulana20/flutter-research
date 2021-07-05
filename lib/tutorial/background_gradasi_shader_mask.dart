import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Gardient Opacity"),
      ),
      body: Center(
        child: ShaderMask(
          shaderCallback: (rectangle) {
            return LinearGradient(
                    colors: [Colors.black, Colors.transparent],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter)
                .createShader(Rect.fromLTRB(
                    0, 0, rectangle.width, rectangle.height));
          },
          blendMode: BlendMode.dstIn,
          child: Image(
            width: 300,
            image: NetworkImage(
                "https://pngimage.net/wp-content/uploads/2018/06/pemandangan-png.png"),
          ),
        ),
      ),
    );
  }
}
