import 'package:flutter/cupertino.dart';

List<Widget> customDashedLine() {
  return List.generate(
      30,
      (index) => Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2),
              child: Container(
                height: 2,
                width: 2,
                color: const Color(0xffB8B8B8),
              ),
            ),
          ));
}
