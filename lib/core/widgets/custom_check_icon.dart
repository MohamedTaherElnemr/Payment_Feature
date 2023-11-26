import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class customCheckIcon extends StatelessWidget {
  const customCheckIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 50,
      child: CircleAvatar(
        radius: 40,
        child: Icon(
          Icons.check,
          size: 50,
          color: Colors.white,
        ),
        backgroundColor: Color(0xFF34A853),
      ),
      backgroundColor: Color(0xFFD9D9D9),
    );
  }
}
