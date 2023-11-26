import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../utils/styles.dart';

AppBar buildAppbar(title) {
  return AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0,
    centerTitle: true,
    leading: Center(child: SvgPicture.asset('assets/images/arrow.svg')),
    title: Text(
      '$title',
      textAlign: TextAlign.center,
      style: Styles.style25,
    ),
  );
}
